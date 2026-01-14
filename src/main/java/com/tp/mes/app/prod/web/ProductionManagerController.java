package com.tp.mes.app.prod.web;

import com.tp.mes.app.prod.model.*;
import com.tp.mes.app.prod.service.EquipmentService;
import com.tp.mes.app.prod.service.ProductionAnalysisService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

/**
 * Production Manager Controller - 관리자용 생산관리 컨트롤러
 */
@Slf4j
@Controller
@RequestMapping("/production")
@RequiredArgsConstructor
public class ProductionManagerController {

    private final EquipmentService equipmentService;
    private final ProductionAnalysisService analysisService;

    /**
     * 생산관리 루트 - 대시보드로 리다이렉트
     */
    @GetMapping
    public String index() {
        return "redirect:/production/dashboard";
    }

    /**
     * 관리자 대시보드
     */
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        log.info("Accessing production manager dashboard");

        // KPI 요약
        ProductionKpiSummary kpi = analysisService.getTodayKpiSummary();
        model.addAttribute("kpi", kpi);

        // 전체 장비 현황
        List<Equipment> allEquipment = equipmentService.listAllEquipment();
        model.addAttribute("equipment", allEquipment);

        // 점검 필요 장비
        List<Equipment> maintenanceDue = equipmentService.findMaintenanceDueEquipment();
        model.addAttribute("maintenanceDue", maintenanceDue);

        // 최근 7일 달성률
        LocalDate endDate = LocalDate.now();
        LocalDate startDate = endDate.minusDays(6);
        List<DailyAchievementDto> dailyAchievement = analysisService.getDailyAchievementRate(startDate, endDate);
        model.addAttribute("dailyAchievement", dailyAchievement);

        return "production/manager-dashboard";
    }

    /**
     * 장비 관리 화면
     */
    @GetMapping("/equipment")
    public String equipmentManagement(
            @RequestParam(value = "lineId", required = false) String lineId,
            @RequestParam(value = "status", required = false) String status,
            Model model) {

        log.info("Accessing equipment management - lineId: {}, status: {}", lineId, status);

        List<Equipment> equipmentList;

        if (lineId != null && !lineId.isEmpty()) {
            equipmentList = equipmentService.listEquipmentByLine(lineId);
        } else if (status != null && !status.isEmpty()) {
            equipmentList = equipmentService.listEquipmentByStatus(EquipmentStatus.valueOf(status));
        } else {
            equipmentList = equipmentService.listAllEquipment();
        }

        model.addAttribute("equipment", equipmentList);
        model.addAttribute("selectedLineId", lineId);
        model.addAttribute("selectedStatus", status);
        model.addAttribute("statusOptions", EquipmentStatus.values());

        return "production/equipment-management";
    }

    /**
     * 장비 상태 변경 (AJAX)
     */
    @PostMapping("/equipment/{equipmentId}/status")
    @ResponseBody
    public String updateEquipmentStatus(
            @PathVariable Long equipmentId,
            @RequestParam String status) {

        log.info("Updating equipment {} status to {}", equipmentId, status);

        try {
            EquipmentStatus newStatus = EquipmentStatus.valueOf(status);
            equipmentService.updateEquipmentStatus(equipmentId, newStatus);
            return "SUCCESS";
        } catch (Exception e) {
            log.error("Failed to update equipment status", e);
            return "FAILED: " + e.getMessage();
        }
    }

    /**
     * 장비 점검 기록 (AJAX)
     */
    @PostMapping("/equipment/{equipmentId}/maintenance")
    @ResponseBody
    public String recordMaintenance(@PathVariable Long equipmentId) {
        log.info("Recording maintenance for equipment {}", equipmentId);

        try {
            equipmentService.recordMaintenance(equipmentId);
            return "SUCCESS";
        } catch (Exception e) {
            log.error("Failed to record maintenance", e);
            return "FAILED: " + e.getMessage();
        }
    }

    /**
     * 분석 리포트 화면
     */
    @GetMapping("/analytics")
    public String analytics(
            @RequestParam(value = "startDate", required = false) String startDateStr,
            @RequestParam(value = "endDate", required = false) String endDateStr,
            Model model) {

        LocalDate endDate = endDateStr != null ? LocalDate.parse(endDateStr) : LocalDate.now();
        LocalDate startDate = startDateStr != null ? LocalDate.parse(startDateStr) : endDate.minusDays(6);

        log.info("Accessing analytics - from {} to {}", startDate, endDate);

        // 일별 달성률
        List<DailyAchievementDto> dailyAchievement = analysisService.getDailyAchievementRate(startDate, endDate);
        model.addAttribute("dailyAchievement", dailyAchievement);

        // 라인별 불량률
        List<DefectRateDto> defectRates = analysisService.getDefectRateByLine(startDate, endDate);
        model.addAttribute("defectRates", defectRates);

        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);

        return "production/analytics";
    }

    /**
     * 계획 상세 분석 (AJAX)
     */
    @GetMapping("/plans/{planId}/analysis")
    @ResponseBody
    public PlanAchievementReport analyzePlan(@PathVariable Long planId) {
        log.info("Analyzing plan: {}", planId);
        return analysisService.analyzePlanAchievement(planId);
    }
}
