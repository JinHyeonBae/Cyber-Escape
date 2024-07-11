package com.cyber.escape.global.common;

import java.util.UUID;

public interface BaseRepository {
    public Long findIdByUuid(UUID uuid);
}
