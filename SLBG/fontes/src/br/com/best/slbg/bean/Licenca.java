/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.best.slbg.bean;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author marcelo
 */
@Entity
@Table(name = "Licenca")
@NamedQueries({
    @NamedQuery(name = "Licenca.findAll",
               query = "SELECT l FROM Licenca l"),
    @NamedQuery(name = "Licenca.findByNomeServidor",
               query = "SELECT l FROM Licenca l WHERE l.licencaPK.nomeServidor = :nomeServidor"),
    @NamedQuery(name = "Licenca.findByNumeroContrato",
               query = "SELECT l FROM Licenca l WHERE l.licencaPK.numeroContrato = :numeroContrato"),
    @NamedQuery(name = "Licenca.findByChave",
               query = "SELECT l FROM Licenca l WHERE l.licencaPK.nomeServidor = :nomeServidor " +
               "AND l.licencaPK.numeroContrato = :numeroContrato")
})
public class Licenca implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected LicencaPK licencaPK;
    @Column(name = "qtdModelo")
    private Integer qtdModelo;
    @Column(name = "qtdVisao")
    private Integer qtdVisao;
    @Column(name = "dataProximaRenovacaoAluguel")
    @Temporal(TemporalType.DATE)
    private Date dataProximaRenovacaoAluguel;
    @Column(name = "prazoMesesRenovacao")
    private Integer prazoMesesRenovacao;
    @Column(name = "nomeMaquina", length=100)
    private String nomeMaquina;
    @Column(name = "valorGeradoBest",length=100)
    private String valorGeradoBest;
    @Column(name = "valorSerial", length=100)
    private String valorSerial;
    @JoinColumn(name = "numeroContrato", referencedColumnName = "numeroContrato", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Cliente cliente;

    public Licenca() {
    }

    public Licenca(LicencaPK licencaPK) {
        this.licencaPK = licencaPK;
    }

    public Licenca(String nomeServidor, String numeroContrato) {
        this.licencaPK = new LicencaPK(nomeServidor, numeroContrato);
    }

    public LicencaPK getLicencaPK() {
        return licencaPK;
    }

    public void setLicencaPK(LicencaPK licencaPK) {
        this.licencaPK = licencaPK;
    }

    public Integer getQtdModelo() {
        return qtdModelo;
    }

    public void setQtdModelo(Integer qtdModelo) {
        this.qtdModelo = qtdModelo;
    }

    public Integer getQtdVisao() {
        return qtdVisao;
    }

    public void setQtdVisao(Integer qtdVisao) {
        this.qtdVisao = qtdVisao;
    }

    public Date getDataProximaRenovacaoAluguel() {
        return dataProximaRenovacaoAluguel;
    }

    public void setDataProximaRenovacaoAluguel(Date dataProximaRenovacaoAluguel) {
        this.dataProximaRenovacaoAluguel = dataProximaRenovacaoAluguel;
    }

    public Integer getPrazoMesesRenovacao() {
        return prazoMesesRenovacao;
    }

    public void setPrazoMesesRenovacao(Integer prazoMesesRenovacao) {
        this.prazoMesesRenovacao = prazoMesesRenovacao;
    }

    public String getValorGeradoBest() {
        return valorGeradoBest;
    }

    public void setValorGeradoBest(String valorGeradoBest) {
        this.valorGeradoBest = valorGeradoBest;
    }

    public String getValorSerial() {
        return valorSerial;
    }

    public void setValorSerial(String valorSerial) {
        this.valorSerial = valorSerial;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getNomeMaquina() {
        return nomeMaquina;
    }

    public void setNomeMaquina(String nomeMaquina) {
        this.nomeMaquina = nomeMaquina;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (licencaPK != null ? licencaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Licenca)) {
            return false;
        }
        Licenca other = (Licenca) object;
        if ((this.licencaPK == null && other.licencaPK != null) || (this.licencaPK != null && !this.licencaPK.equals(other.licencaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.com.best.slbg.bean.Licenca[licencaPK=" + licencaPK + "]";
    }

}
