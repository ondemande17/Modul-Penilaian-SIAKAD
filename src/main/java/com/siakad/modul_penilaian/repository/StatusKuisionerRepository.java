package com.siakad.modul_penilaian.repository;

import java.util.List;
import java.util.UUID;

import com.sia.main.domain.StatusKuisioner;

public interface StatusKuisionerRepository {
	public List<StatusKuisioner> getByKrsKuisioner(UUID idKrs, UUID idKuisioner);
	public UUID insert(StatusKuisioner status);
}
