package com.tp.mes.app.factory.controller;

import com.tp.mes.app.factory.model.Factory;
import com.tp.mes.app.factory.model.Plant;
import com.tp.mes.app.factory.model.ProductionLine;
import com.tp.mes.app.factory.service.FactoryService;
import java.time.LocalDate;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 공장 관리 Controller
 */
@Controller
@RequestMapping("/factory")
@RequiredArgsConstructor
@Slf4j
public class FactoryController {

    private final FactoryService factoryService;

    // ========== 대시보드 ==========

    /**
     * 공장 관리 대시보드
     */
    @GetMapping("")
    public String dashboard(Model model) {
        List<Plant> plants = factoryService.getAllPlants();
        List<Factory> factories = factoryService.getAllFactories();
        List<ProductionLine> runningLines = factoryService.getRunningLines();

        model.addAttribute("plants", plants);
        model.addAttribute("factories", factories);
        model.addAttribute("runningLines", runningLines);

        return "factory/dashboard";
    }

    // ========== Plant 관리 ==========

    /**
     * 사업장 목록
     */
    @GetMapping("/plants")
    public String plantList(
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String status,
            Model model) {

        List<Plant> plants;
        if (type != null && !type.isEmpty()) {
            plants = factoryService.getPlantsByType(type);
        } else if (status != null && !status.isEmpty()) {
            plants = factoryService.getPlantsByStatus(status);
        } else {
            plants = factoryService.getAllPlants();
        }

        model.addAttribute("plants", plants);
        model.addAttribute("selectedType", type);
        model.addAttribute("selectedStatus", status);

        return "factory/plant-list";
    }

    /**
     * 사업장 등록 폼
     */
    @GetMapping("/plants/new")
    public String plantForm(Model model) {
        model.addAttribute("mode", "new");
        return "factory/plant-form";
    }

    /**
     * 사업장 등록 처리
     */
    @PostMapping("/plants")
    public String createPlant(
            @RequestParam String plantId,
            @RequestParam String plantName,
            @RequestParam(required = false) String plantNameEn,
            @RequestParam(required = false) String address,
            @RequestParam(required = false) String addressDetail,
            @RequestParam(required = false) String postalCode,
            @RequestParam String plantType,
            @RequestParam(defaultValue = "ACTIVE") String status,
            @RequestParam(required = false) Double totalArea,
            @RequestParam(required = false) LocalDate establishedDate,
            @RequestParam(required = false) String phone,
            RedirectAttributes redirectAttributes) {

        Plant plant = new Plant(
                plantId, plantName, plantNameEn, address, addressDetail,
                postalCode, null, plantType, status, totalArea,
                establishedDate, null, phone, null, null, null);

        factoryService.createPlant(plant);

        redirectAttributes.addFlashAttribute("message", "사업장이 등록되었습니다: " + plantName);
        return "redirect:/factory/plants";
    }

    /**
     * 사업장 상세
     */
    @GetMapping("/plants/{plantId}")
    public String plantDetail(@PathVariable String plantId, Model model) {
        Plant plant = factoryService.getPlantById(plantId)
                .orElseThrow(() -> new IllegalArgumentException("사업장을 찾을 수 없습니다: " + plantId));

        List<Factory> factories = factoryService.getFactoriesByPlant(plantId);

        model.addAttribute("plant", plant);
        model.addAttribute("factories", factories);
        model.addAttribute("mode", "edit");

        return "factory/plant-detail";
    }

    /**
     * 사업장 수정 처리
     */
    @PostMapping("/plants/{plantId}")
    public String updatePlant(
            @PathVariable String plantId,
            @RequestParam String plantName,
            @RequestParam(required = false) String plantNameEn,
            @RequestParam(required = false) String address,
            @RequestParam(required = false) String addressDetail,
            @RequestParam(required = false) String postalCode,
            @RequestParam String plantType,
            @RequestParam String status,
            @RequestParam(required = false) Double totalArea,
            @RequestParam(required = false) LocalDate establishedDate,
            @RequestParam(required = false) String phone,
            RedirectAttributes redirectAttributes) {

        Plant existing = factoryService.getPlantById(plantId)
                .orElseThrow(() -> new IllegalArgumentException("사업장을 찾을 수 없습니다"));

        Plant updated = new Plant(
                plantId, plantName, plantNameEn, address, addressDetail,
                postalCode, existing.getCoordinates(), plantType, status,
                totalArea, establishedDate, existing.getManagerEmpId(),
                phone, existing.getFax(), existing.getCreatedAt(), null);

        factoryService.updatePlant(updated);

        redirectAttributes.addFlashAttribute("message", "사업장 정보가 수정되었습니다");
        return "redirect:/factory/plants/" + plantId;
    }

    // ========== Factory 관리 ==========

    /**
     * 공장 목록
     */
    @GetMapping("/factories")
    public String factoryList(
            @RequestParam(required = false) String plant,
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String status,
            Model model) {

        List<Factory> factories;
        if (plant != null && !plant.isEmpty()) {
            factories = factoryService.getFactoriesByPlant(plant);
        } else if (type != null && !type.isEmpty()) {
            factories = factoryService.getFactoriesByType(type);
        } else if (status != null && !status.isEmpty()) {
            factories = factoryService.getFactoriesByStatus(status);
        } else {
            factories = factoryService.getAllFactories();
        }

        List<Plant> plants = factoryService.getAllPlants();

        model.addAttribute("factories", factories);
        model.addAttribute("plants", plants);
        model.addAttribute("selectedPlant", plant);
        model.addAttribute("selectedType", type);
        model.addAttribute("selectedStatus", status);

        return "factory/factory-list";
    }

    /**
     * 공장 등록 폼
     */
    @GetMapping("/factories/new")
    public String factoryForm(Model model) {
        List<Plant> plants = factoryService.getAllPlants();
        model.addAttribute("plants", plants);
        model.addAttribute("mode", "new");
        return "factory/factory-form";
    }

    /**
     * 공장 등록 처리
     */
    @PostMapping("/factories")
    public String createFactory(
            @RequestParam String factoryId,
            @RequestParam String plantId,
            @RequestParam String factoryName,
            @RequestParam(required = false) String factoryNameEn,
            @RequestParam String factoryType,
            @RequestParam(defaultValue = "ACTIVE") String status,
            @RequestParam(required = false) String productCategory,
            @RequestParam(required = false) Double targetUtilizationRate,
            RedirectAttributes redirectAttributes) {

        Factory factory = new Factory(
                factoryId, plantId, factoryName, factoryNameEn, null,
                factoryType, status, productCategory, null, null, null,
                targetUtilizationRate, null, null, null);

        factoryService.createFactory(factory);

        redirectAttributes.addFlashAttribute("message", "공장이 등록되었습니다: " + factoryName);
        return "redirect:/factory/factories";
    }

    /**
     * 공장 상세
     */
    @GetMapping("/factories/{factoryId}")
    public String factoryDetail(@PathVariable String factoryId, Model model) {
        Factory factory = factoryService.getFactoryById(factoryId)
                .orElseThrow(() -> new IllegalArgumentException("공장을 찾을 수 없습니다: " + factoryId));

        List<ProductionLine> lines = factoryService.getLinesByFactory(factoryId);

        model.addAttribute("factory", factory);
        model.addAttribute("lines", lines);
        model.addAttribute("mode", "edit");

        return "factory/factory-detail";
    }

    // ========== Production Line 관리 ==========

    /**
     * 생산라인 목록
     */
    @GetMapping("/lines")
    public String lineList(
            @RequestParam(required = false) String factory,
            @RequestParam(required = false) String status,
            Model model) {

        List<ProductionLine> lines;
        if (factory != null && !factory.isEmpty()) {
            lines = factoryService.getLinesByFactory(factory);
        } else if (status != null && !status.isEmpty()) {
            lines = factoryService.getLinesByStatus(status);
        } else {
            lines = factoryService.getAllLines();
        }

        List<Factory> factories = factoryService.getAllFactories();

        model.addAttribute("lines", lines);
        model.addAttribute("factories", factories);
        model.addAttribute("selectedFactory", factory);
        model.addAttribute("selectedStatus", status);

        return "factory/line-list";
    }

    /**
     * 생산라인 등록 폼
     */
    @GetMapping("/lines/new")
    public String lineForm(Model model) {
        List<Factory> factories = factoryService.getAllFactories();
        model.addAttribute("factories", factories);
        model.addAttribute("mode", "new");
        return "factory/line-form";
    }

    /**
     * 생산라인 등록 처리
     */
    @PostMapping("/lines")
    public String createLine(
            @RequestParam String lineId,
            @RequestParam String factoryId,
            @RequestParam String lineName,
            @RequestParam String lineType,
            @RequestParam(defaultValue = "STOPPED") String status,
            @RequestParam(defaultValue = "0") Integer maxCapacity,
            @RequestParam(defaultValue = "0") Integer standardWorkers,
            RedirectAttributes redirectAttributes) {

        ProductionLine line = new ProductionLine(
                lineId, factoryId, lineName, null, lineType,
                status, false, maxCapacity, 0, 0, 0.0,
                standardWorkers, 0, null, null, null, null,
                null, null, null);

        factoryService.createLine(line);

        redirectAttributes.addFlashAttribute("message", "생산라인이 등록되었습니다: " + lineName);
        return "redirect:/factory/lines";
    }

    /**
     * 생산라인 상태 변경
     */
    @PostMapping("/lines/{lineId}/status")
    public String changeLineStatus(
            @PathVariable String lineId,
            @RequestParam String status,
            @RequestParam(defaultValue = "false") Boolean isOperating,
            RedirectAttributes redirectAttributes) {

        factoryService.changeLineStatus(lineId, status, isOperating);

        redirectAttributes.addFlashAttribute("message", "라인 상태가 변경되었습니다");
        return "redirect:/factory/lines";
    }
}
