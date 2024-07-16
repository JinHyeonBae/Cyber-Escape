package com.cyber.escape.domain.chat.repository;

import com.cyber.escape.domain.chat.entity.Participants;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.swing.text.html.Option;
import java.util.Optional;
import java.util.UUID;


@Repository
public interface ParticipantsRepository extends JpaRepository<Participants, Long>, ParticipantsRepositoryCustom {

    public Optional<Participants> findByUuid(UUID uuid);

}
