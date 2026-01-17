package com.tp.mes.app.prod.model;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class MaintenanceHistory {
    private Long historyId;
    private Long equipmentId;
    private LocalDateTime maintenanceDate;
    private String worker;
    private String description;
    private LocalDateTime createdAt;
}
