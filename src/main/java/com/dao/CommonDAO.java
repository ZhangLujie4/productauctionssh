package com.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

/**
 * @author DMZ
 * @description
 */

@Repository("CommonDAO")
public class CommonDAO {
	private static final Log log = LogFactory.getLog(CommonDAO.class);

	@PersistenceContext
	private EntityManager entityManager;

	@Transactional
	public void save(Object transientInstance) {

		entityManager.persist(transientInstance);

	}

	@Transactional
	public void delete(Object persistentInstance) {

		entityManager.remove(entityManager.merge(persistentInstance));
	}

	public Object findById(int id,String entity){
		Object instance = null;
		try {
			instance = entityManager.find(Class.forName("com.model."+entity), id);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return instance;
	}
	
	public Object findById(String id,String entity){

		Object instance = null;
		try {
			instance = entityManager.find(Class.forName("com.model."+entity), Integer.parseInt(id) );
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return instance;
	}


	
	
	public List findByHql(String hql) {

		return entityManager.createQuery(hql).getResultList();
	}
	
	public List findByHql(String hql,int dpage,int rows) {
		try {
			List list = entityManager.createQuery(hql).getResultList();
			List mlist=new ArrayList();
			try{
				int min = (dpage-1)*rows;
				int max = dpage*rows;
				
				for(int i=0;i<list.size();i++)
				{
					
					if(!(i<min||i>(max-1)))
					{
					mlist.add(list.get(i));
					}
				}
			}catch(RuntimeException re){
				re.printStackTrace();
				throw re;
			}
			return mlist;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@Transactional
	public Object update(Object detachedInstance) {
		entityManager.merge(detachedInstance);
		return null;
	}

	@Transactional
	public void delete(int id,String entity) {

		System.out.println("cc="+id);
		try {
			entityManager.remove(entityManager.find(Class.forName("com.model."+entity), id));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String  id,String entity) {
		System.out.println("cc="+id);
		try {
			entityManager.remove(entityManager.find(Class.forName("com.model."+entity), Integer.parseInt(id)));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static CommonDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CommonDAO) ctx.getBean("CommonDAO");
	}
}