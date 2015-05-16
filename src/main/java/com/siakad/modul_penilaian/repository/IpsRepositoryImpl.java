package com.siakad.modul_penilaian.repository;

import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sia.main.domain.Ips;

@Repository
public class IpsRepositoryImpl implements IpsRepository {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Ips> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UUID insert(Ips ips) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		UUID insertId = (UUID) session.save(ips);
		tx.commit();
		session.flush();
		session.close();
		return insertId;
	}

	@Override
	public void update(Ips ips) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(ips);
		tx.commit();
		session.flush();
		session.close();
	}

	@Override
	@Transactional
	public Ips find(UUID idPd, UUID idTglSmt) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("SELECT ips FROM Ips as ips WHERE id_pd = '" + idPd + "' AND id_tgl_smt = '" + idTglSmt + "'");
		if (query.list().isEmpty())
			return null;
		else
			return (Ips) query.list().get(0);
	}

}