/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.best.slbg.bean;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author marcelo
 */
@Embeddable
public class LicencaPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "nomeServidor")
    private String nomeServidor;
    @Basic(optional = false)
    @Column(name = "numeroContrato")
    private String numeroContrato;

    public LicencaPK() {
    }

    public LicencaPK(String nomeServidor, String numeroContrato) {
        this.nomeServidor = nomeServidor;
        this.numeroContrato = numeroContrato;
    }

    public String getNomeServidor() {
        return nomeServidor;
    }

    public void setNomeServidor(String nomeServidor) {
        this.nomeServidor = nomeServidor;
    }

    public String getNumeroContrato() {
        return numeroContrato;
    }

    public void setNumeroContrato(String numeroContrato) {
        this.numeroContrato = numeroContrato;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nomeServidor != null ? nomeServidor.hashCode() : 0);
        hash += (numeroContrato != null ? numeroContrato.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LicencaPK)) {
            return false;
        }
        LicencaPK other = (LicencaPK) object;
        if ((this.nomeServidor == null && other.nomeServidor != null) || (this.nomeServidor != null && !this.nomeServidor.equals(other.nomeServidor))) {
            return false;
        }
        if ((this.numeroContrato == null && other.numeroContrato != null) || (this.numeroContrato != null && !this.numeroContrato.equals(other.numeroContrato))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.com.best.slbg.bean.LicencaPK[nomeServidor=" + nomeServidor + ", numeroContrato=" + numeroContrato + "]";
    }

}
