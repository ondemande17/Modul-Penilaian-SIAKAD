package com.siakad.modul_penilaian.repository;

import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sia.main.domain.Pemb;

@Repository
public class PembRepositoryImpl implements PembRepository {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public Pemb getById(UUID idPemb) {
		// TODO Auto-generated method stub
		return (Pemb) sessionFactory.getCurrentSession().get(Pemb.class, idPemb);
	}
	
	@Override
	@Transactional
	public List<Pemb> getByTglSmt(UUID idTglSmt) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("SELECT pemb FROM Pemb pemb WHERE pemb.tglSmt.idTglSmt = '" + idTglSmt + "'");
		return query.list();
	}
	
	@Override
	@Transactional
	public List<Pemb> getAll() {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM Pemb");
		return query.list();
	}

}
