package com.siakad.modul_penilaian.repository;

import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sia.main.domain.MenuPeran;

@Repository
public class MenuPeranRepositoryImpl implements MenuPeranRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<MenuPeran> get(String where, String order, int limit, int offset) {
		String dbWhere ="";
		String dbOrder ="";
		if(where != "") dbWhere = " WHERE "+where;
		if(order != "") dbOrder = " ORDER BY "+order;
		
		Query query = sessionFactory.getCurrentSession().createQuery("select menuPeran from MenuPeran "
				+ "menuPeran join menuPeran.menu menu join menu.modul modul join menuPeran.peran peran "
				+dbWhere+dbOrder);
		
		if(limit != -1 && limit>0) {
			query.setFirstResult(offset);
			if(offset < 0) offset = 0;
			query.setMaxResults(limit);
		}
		
		return query.list();
	}

	@Override
	public MenuPeran getById(UUID idAnggotaRombel) {
		List<MenuPeran> queryResult = sessionFactory.getCurrentSession().createQuery("from MenuPeran "
				+ "WHERE idMenuPeran = '"+idAnggotaRombel.toString()+"'").list();
		if(queryResult.size()==0) return null;
		return queryResult.get(0);
	}

	@Override
	public UUID insert(MenuPeran menuPeran) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		UUID insertId= (UUID)session.save(menuPeran);
		tx.commit();
		session.flush();
		session.close();
		return insertId;
	}

	@Override
	public void update(MenuPeran menuPeran) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(menuPeran);
		tx.commit();
		session.flush();
		session.close();
	}

	@Override
	public void delete(MenuPeran menuPeran) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(menuPeran);
		tx.commit();
		session.flush();
		session.close();
	}

	@Override
	public long count(String where) {
		String dbWhere ="";
		if(where != "") dbWhere = " WHERE "+where;
		Query query = sessionFactory.getCurrentSession().createQuery(
				"select count(*) from MenuPeran "
				+ "menuPeran join menuPeran.menu menu join menu.modul modul join menuPeran.peran peran "
				+ dbWhere);
		Long count = (Long)query.uniqueResult();
		return count;
	}

}
