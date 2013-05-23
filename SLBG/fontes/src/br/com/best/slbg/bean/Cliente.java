/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.best.slbg.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author marcelo
 */
@Entity
@Table(name = "Cliente")
@NamedQueries({
    @NamedQuery(name = "Cliente.findAll",
               query = "SELECT c FROM Cliente c"),
    @NamedQuery(name = "Cliente.findByNumeroContrato",
               query = "SELECT c FROM Cliente c WHERE c.numeroContrato = :numeroContrato"),
    @NamedQuery(name = "Cliente.findByRazaoSocial",
               query = "SELECT c FROM Cliente c WHERE c.razaoSocial = :razaoSocial"),
    @NamedQuery(name = "Cliente.findByNomeContato",
               query = "SELECT c FROM Cliente c WHERE c.nomeContato = :nomeContato"),
    @NamedQuery(name = "Cliente.findByCpfCnpj",
               query = "SELECT c FROM Cliente c WHERE c.cpfCnpj = :cpfCnpj"),
    @NamedQuery(name = "Cliente.findByRgIe",
               query = "SELECT c FROM Cliente c WHERE c.rgIe = :rgIe"),
    @NamedQuery(name = "Cliente.findByDataVenda",
               query = "SELECT c FROM Cliente c WHERE c.dataVenda = :dataVenda"),
    @NamedQuery(name = "Cliente.count",
                query = "SELECT COUNT(t.numeroContrato) FROM Cliente t")
})
public class Cliente implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "numeroContrato",length=20)
    private String numeroContrato;
    @Column(name = "razaoSocial",length=60)
    private String razaoSocial;
    @Column(name = "nomeContato",length=60)
    private String nomeContato;
    @Column(name = "cpfCnpj",length=14)
    private String cpfCnpj;
    @Column(name = "rgIe",length=14)
    private String rgIe;
    @Column(name = "Fone",length=14)
    private String fone;
    @Column(name = "email",length=100)
    private String email;
    @Column(name = "modalidadeVenda",length=1)
    private String modalidadeVenda;
    @Column(name = "qtdMaquinas")
    private Integer qtdMaquinas;
    @Column(name = "dataVenda")
    @Temporal(TemporalType.DATE)
    private Date dataVenda;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cliente")
    private List<Licenca> licencaList;

    public Cliente() {
    }

    public Cliente(String numeroContrato) {
        this.numeroContrato = numeroContrato;
    }

    public String getNumeroContrato() {
        return numeroContrato;
    }

    public void setNumeroContrato(String numeroContrato) {
        this.numeroContrato = numeroContrato;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getNomeContato() {
        return nomeContato;
    }

    public void setNomeContato(String nomeContato) {
        this.nomeContato = nomeContato;
    }

    public String getCpfCnpj() {
        return cpfCnpj;
    }

    public void setCpfCnpj(String cpfCnpj) {
        this.cpfCnpj = cpfCnpj;
    }

    public String getRgIe() {
        return rgIe;
    }

    public void setRgIe(String rgIe) {
        this.rgIe = rgIe;
    }

    public String getFone() {
        return fone;
    }

    public void setFone(String fone) {
        this.fone = fone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getModalidadeVenda() {
        return modalidadeVenda;
    }

    public void setModalidadeVenda(String modalidadeVenda) {
        this.modalidadeVenda = modalidadeVenda;
    }

    public Integer getQtdMaquinas() {
        return qtdMaquinas;
    }

    public void setQtdMaquinas(Integer qtdMaquinas) {
        this.qtdMaquinas = qtdMaquinas;
    }

    public Date getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(Date dataVenda) {
        this.dataVenda = dataVenda;
    }

    public List<Licenca> getLicencaList() {
        return licencaList;
    }

    public void setLicencaList(List<Licenca> licencaList) {
        this.licencaList = licencaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (numeroContrato != null ? numeroContrato.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cliente)) {
            return false;
        }
        Cliente other = (Cliente) object;
        if ((this.numeroContrato == null && other.numeroContrato != null) || (this.numeroContrato != null && !this.numeroContrato.equals(other.numeroContrato))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.com.best.slbg.bean.Cliente[numeroContrato=" + numeroContrato + "]";
    }

}
