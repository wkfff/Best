/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.best.slbg.dao;

import br.com.best.slbg.bean.Cliente;
import br.com.best.slbg.bean.Licenca;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author marcelo
 */
public class SlbgDao {
    private EntityManager manager;

    /**
     * Query que efetua a busca do cliente pela aproximação da Razão Social
     * ou seja, utilizando 'LIKE'
     */
    private final String razaoProximo ="select p from Cliente p where p.razaoSocial like ?1";
    
    /**
     * Query que apresenta os vencimentos do Aluguel do Best
     */
    private final String vencimentoAluguel = "select p from Licenca p where " +
            "(p.cliente.modalidadeVenda ='A' or p.cliente.modalidadeVenda = 'D')" +
            "order by p.dataProximaRenovacaoAluguel";
    
    /**
     *  Query que apresenta as máquinas ainda sem serial
     */
    private final String maquinasSemSerial = "select p from Licenca p ";

     /**
     * Contrutor que captura a fábrica de conexões
     */
    public SlbgDao() {
        this.manager = ConnectionFactory.getConnection();
    }

    /**
     * gravaCliente
     *
     * Efetua a inclusão dos Clientes
     *
     * @param cliente
     */
    public void gravaCliente(Cliente cliente) {
        manager.getTransaction().begin();
        manager.merge(cliente);
        manager.getTransaction().commit();
    }

    /**
     * gravaRelacaoLicencas
     *
     * Efetua a inclusão da lista de máquinas que possuirão licenças do Best
     * @param licenca
     */
    public void gravaRelacaoLicencas(Licenca licenca) {
        manager.getTransaction().begin();
        manager.merge(licenca);
        manager.getTransaction().commit();
    }

    /**
     * apagarSerial
     *
     * Apaga o Cliente com sua relação de máquinas
     * @param cliente
     */
    public void apagarSerial(Cliente cliente) {
        manager.getTransaction().begin();
        manager.remove(cliente);
        manager.getTransaction().commit();
    }

    /**
     * listaSerial
     *
     * Lista todos os Clientes Cadastrados
     * @return
     */
    public List <Cliente> listaSerial() {
        return (List<Cliente>) manager.
                createNamedQuery("Cliente.findAll").getResultList();
    }

    /**
     * listaPorRazao
     *
     * Lista todos os Clientes filtrados pela Razão Social
     * de forma exata
     * @param razao
     * @return
     */
    public List<Cliente> listaPorRazao(String razao) {
        return (List<Cliente>) manager.
                createNamedQuery("ClienteBest.findByRazaoSocial").
                setParameter("razaoSocial", razao).getResultList();
    }

     /**
     * listaUnicoCliente
     *
     * Lista um único cliente pelo número do Contrato que é o Id
     * @param idCliente
     * @return
     */
    public Cliente listaUnicoCliente(String idCliente) {
        return manager.find(Cliente.class, idCliente);
    }

     /**
     * qtdMaxLinhas
     * 
     * Recebe a quantidade de linhas da tabela de clientes
     * @return
     */
    public Long qtdMaxLinhas() {
      return (Long) manager.createNamedQuery("Cliente.count").getSingleResult();
    }


    /**
     * listaRazaoProximo
     *
     * Efetua uma busca de Clientes por Razão Social de forma aproximada.
     * @param razao
     * @return
     */
    public List<Cliente> listaRazaoProximo(String razao) {
        Query query = manager.createQuery(razaoProximo);
        query.setParameter(1, "%"+razao+"%");
        return query.getResultList();
    }

    /**
     * listaLicencasChave
     *
     * Efetua a busca exata pela chave composta da Licença
     * @param contrato
     * @param maquina
     * @return
     */
    public List<Licenca> listaLicencasChave(String contrato, String maquina) {
        return (List<Licenca>) manager.createNamedQuery("Licenca.findByChave").
                setParameter("nomeServidor", maquina).
                setParameter("numeroContrato", contrato).getResultList();
    }

    /**
     * listaLicencasContrato
     * 
     * Efetua uma busca de licenças de um contrato específico.
     * @param contrato
     * @return
     */
    public List<Licenca> listaLicencasContrato (String contrato) {
        return (List<Licenca>) manager.createNamedQuery("Licenca.findByNumeroContrato").
                setParameter("numeroContrato", contrato).getResultList();
    }
    
    /**
     * listaVencimento
     * 
     * Returna uma lista de Licenças que estão por vencer.
     * @return
     */
    public List<Licenca> listaVencimento() {
        Query query = manager.createQuery(vencimentoAluguel);
        return query.getResultList();
    }
}
