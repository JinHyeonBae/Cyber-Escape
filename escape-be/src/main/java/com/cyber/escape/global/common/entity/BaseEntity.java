package com.cyber.escape.global.common.entity;

import com.cyber.escape.domain.auth.util.UuidUtil;
import jakarta.persistence.*;
import lombok.Getter;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.UUID;

@Getter
@EntityListeners(AuditingEntityListener.class)
@MappedSuperclass
public class BaseEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

    @Column(columnDefinition = "BINARY(16)")
	private UUID uuid = UUID.nameUUIDFromBytes(UuidUtil.createUUID()); // 랜덤 UUID 생성 및 설정

    @CreatedDate
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @LastModifiedDate
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}
