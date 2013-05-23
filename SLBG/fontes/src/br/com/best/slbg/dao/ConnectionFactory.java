/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.best.slbg.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author marcelo
 */
public class ConnectionFactory {
    
    public static EntityManager getConnection() {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("SLBGPU");
        EntityManager manager = emf.createEntityManager();
        return manager;
    }
}
