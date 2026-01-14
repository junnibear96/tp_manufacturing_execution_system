package com.tp.mes.app.prod.mapper;

import com.tp.mes.app.prod.model.Equipment;
import org.apache.ibatis.annotations.*;
import java.util.List;

/**
 * Equipment MyBatis Mapper
 */
@Mapper
public interface EquipmentMapper {

        /**
         * ID로 장비 조회
         */
        @Select("SELECT * FROM tp_equipment WHERE equipment_id = #{equipmentId}")
        @ResultMap("equipmentResultMap")
        Equipment findById(@Param("equipmentId") Long equipmentId);

        /**
         * 코드로 장비 조회
         */
        @Select("SELECT * FROM tp_equipment WHERE equipment_code = #{equipmentCode}")
        @ResultMap("equipmentResultMap")
        Equipment findByCode(@Param("equipmentCode") String equipmentCode);

        /**
         * 라인별 장비 목록
         */
        @Select("SELECT * FROM tp_equipment WHERE line_id = #{lineId} ORDER BY equipment_code")
        @ResultMap("equipmentResultMap")
        List<Equipment> findByLineId(@Param("lineId") String lineId);

        /**
         * 상태별 장비 목록
         */
        @Select("SELECT * FROM tp_equipment WHERE status = #{status} ORDER BY equipment_code")
        @ResultMap("equipmentResultMap")
        List<Equipment> findByStatus(@Param("status") String status);

        /**
         * 전체 장비 목록
         */
        @Select("SELECT * FROM tp_equipment WHERE active_yn = 'Y' ORDER BY equipment_code")
        @ResultMap("equipmentResultMap")
        List<Equipment> findAll();

        /**
         * 장비 상태 업데이트
         */
        @Update("UPDATE tp_equipment SET status = #{status}, updated_at = SYSTIMESTAMP " +
                        "WHERE equipment_id = #{equipmentId}")
        int updateStatus(@Param("equipmentId") Long equipmentId, @Param("status") String status);

        /**
         * 점검 기록
         */
        @Update("UPDATE tp_equipment SET last_maintenance_at = SYSTIMESTAMP, " +
                        "updated_at = SYSTIMESTAMP WHERE equipment_id = #{equipmentId}")
        int recordMaintenance(@Param("equipmentId") Long equipmentId);

        /**
         * 가동률 업데이트
         */
        @Update("UPDATE tp_equipment SET utilization_rate = #{rate}, " +
                        "updated_at = SYSTIMESTAMP WHERE equipment_id = #{equipmentId}")
        int updateUtilizationRate(@Param("equipmentId") Long equipmentId, @Param("rate") Double rate);

        /**
         * 점검이 필요한 장비 목록 조회 (mapper XML에서 정의)
         */
        List<Equipment> findMaintenanceDue();

        /**
         * 라인의 평균 가동률 조회 (mapper XML에서 정의)
         */
        Double getAverageUtilizationRateByLine(@Param("lineId") String lineId);
}
