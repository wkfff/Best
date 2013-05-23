/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.best.slbg.bo;

import br.com.best.slbg.dao.SlbgDao;
import br.com.best.slbg.bean.Cliente;
import br.com.best.slbg.bean.Licenca;
import java.util.GregorianCalendar;
import java.util.Vector;

/**
 *
 * @author marcelo
 */
public class ClienteBO {

    private SlbgDao slbgDao;

    /**
     * Construtor que efetua a carga da classe DAO
     */
    public ClienteBO() {
        this.slbgDao = new SlbgDao();
    }

    /**
     * incluirCliente
     *
     * Efetua a inclusao do cliente
     *
     * @param cliente
     */
    public void incluirCliente(Cliente cliente) {
        slbgDao.gravaCliente(cliente);
    }

    /**
     * incluirRelacaoLicencas
     *
     * Efetua a inclusão da relação de licenças baseadas no cliente
     *
     * @param licenca
     */
    public void incluirRelacaoLicencas(Licenca licenca) {
        slbgDao.gravaRelacaoLicencas(licenca);
    }

    /**
     * consultaGeralClientes
     *
     * Retorna todos os Clientes para alimentar um JTable
     *
     * @return
     */
    public Vector<Cliente> consultaGeralClientes() {
        Vector geralClientes = new Vector(slbgDao.listaSerial());
        return geralClientes;
    }

    /**
     * consultaClientesNome
     *
     * Retorna todos os Clientes que tenham a mesma Razão Social
     * Isso é posivel porque a chave é o número do contrato
     *
     * @param nome
     * @return
     */
    public Vector<Cliente> consultaClientesNome(String nome) {
        Vector nomeClientes = new Vector(slbgDao.listaPorRazao(nome));
        return nomeClientes;
    }

    /**
     * consultaClientesId
     *
     * Retorna um único Cliente pelo 'ID', que nesse caso é o número
     * do contrato
     *
     * @param idCliente
     * @return
     */
    public Cliente consultaClientesId(String idCliente) {
        return slbgDao.listaUnicoCliente(idCliente);
    }

    /**
     * QtdMaxLinhas
     *
     * Retorna a quantidade de linhas da tabela de Clientes, o que não
     * significa ser a quantidade de clientes, mas sim a quantidade de
     * contratos
     *
     * @return
     */
    public Long QtdMaxLinhas() {
        return slbgDao.qtdMaxLinhas();
    }

    /**
     * excluirCliente
     *
     * Exclui um contrato. Deverá excluir junto todas as máquinas relacionadas
     * a esse contrato. Tome cuidado para que o Best instalado nessas máquinas
     * fique sem seu controle de utilização
     *
     * @param cliente
     */
    public void excluirCliente(Cliente cliente) {
        slbgDao.apagarSerial(cliente);
    }

    /**
     * Gera Serial
     *
     * Temos aqui a geração do número serial que deve ser passado ao Best.
     * O Best por sua vez irá checar e avaliar esse número efetuando as
     * devidas liberações
     *
     * @param cliente
     * @param licenca
     * @param valorBest
     * @return
     */
    public String geraSerial(Cliente cliente, Licenca licenca, String valorBest) {
        String valorGerado = "";

        // A baseUsuario, se tornou um valor fixo porque agora a chave é o
        // número do contrato, antes havia um auto numerador
        Long baseUsuario = 72L;
        String dataLivre;
        Long anoAux = 0L;
        Long mesAux = 0L;
        Long diaAux = 0L;
        Long modeler = 0L;
        Long viewer = 0L;

        // Cálculo para a quantidade de licenças Modeler
        modeler = licenca.getQtdModelo() * 7 + baseUsuario;
        if (modeler < 0) {
            modeler = Math.abs(modeler);
        }

        // Cálculo para a quantidade de licenças Viewer
        viewer = licenca.getQtdVisao() * 7 + baseUsuario;
        if (viewer < 0) {
            viewer = Math.abs(viewer);
        }

        // Para os casos de Aluguel ou cópia de Demonstração, preciso
        // calcular a data limite de validade da cópia.
        // Quando o caso é de venda ou livre, a data se torna "00/00/00"
        if (cliente.getModalidadeVenda().equalsIgnoreCase("A") ||
                cliente.getModalidadeVenda().equalsIgnoreCase("D")) {
            GregorianCalendar data = new GregorianCalendar();
            data.setTime(licenca.getDataProximaRenovacaoAluguel());
            data.add(GregorianCalendar.MONTH, licenca.getPrazoMesesRenovacao());
            licenca.setDataProximaRenovacaoAluguel(data.getTime());
            int ano = data.get(GregorianCalendar.YEAR);
            int mes = data.get(GregorianCalendar.MONTH);
            int dia = data.get(GregorianCalendar.DAY_OF_MONTH);

            anoAux = (ano * 5 + baseUsuario);
            mesAux = (mes * 5 + baseUsuario);
            diaAux = (dia * 5 + baseUsuario);

            dataLivre = "S" + anoAux.toString() + "Y" + mesAux.toString() + "U"
                    + diaAux.toString();
        } else {
            dataLivre = "S" + "00" + "Y" + "00" + "U" + "00";
        }

        // Valor Serial Gerado e montado pra o caso de cópias Livres
        if (cliente.getModalidadeVenda().equalsIgnoreCase("L")) {
            valorGerado = "I" + baseUsuario.toString() + "M" +
                    retornaSerialDisco(valorBest) + "R" + dataLivre + "O" +
                    modeler.toString() + "L" + viewer.toString();
        }

        // Valor Serial Gerado e montado pra o caso de cópias de Demonstração
        if (cliente.getModalidadeVenda().equalsIgnoreCase("D")) {
            valorGerado = "I" + baseUsuario.toString() + "M" +
                    retornaSerialDisco(valorBest) + "R" + dataLivre + "O" +
                    modeler.toString() + "W" + viewer.toString();
        }

        // Valor Serial para os casos de cópias de Aluguel e/ou Venda
        if (cliente.getModalidadeVenda().equalsIgnoreCase("A") |
                cliente.getModalidadeVenda().equalsIgnoreCase("V")) {
        valorGerado = "I" + baseUsuario.toString() + "M" +
                retornaSerialDisco(valorBest) + "R" + dataLivre + "O" +
                modeler.toString() + "P" + viewer.toString();
        }

        return valorGerado;
    }

    /**
     * retornaSerialDisco
     *
     * Retorna a primeira parte da String gerada pelo Best que significa
     * o número serial do disco o qual ele está rodando
     *
     * @param valorImportado
     * @return
     */
    public String retornaSerialDisco(String valorImportado) {
        String manipula[] = valorImportado.split("P");
        String resultado = manipula[0];
        return resultado;
    }

    /**
     * consultaClientesNomeProximo
     *
     * Retorna uma lista de Clientes, utilizando o 'LIKE', ou seja, por
     * aproximação
     *
     * @param nome
     * @return
     */
    public Vector<Cliente> consultaClientesNomeProximo(String nome) {
        Vector nomeClientes = new Vector(slbgDao.listaRazaoProximo(nome));
        return nomeClientes;
    }

    /**
     * consultaLicencasPorContrato
     *
     * Retorna uma lista de máquinas que deverão ou já receberam seu número
     * de série de um determinado contrato
     *
     * @param contrato
     * @return
     */
    public Vector<Licenca> consultaLicencasPorContrato(String contrato) {
        Vector relacaoLicencas = new Vector(slbgDao.listaLicencasContrato(contrato));
        return relacaoLicencas;
    }

    /**
     * consultaLicencasPorVencimento
     *
     * Retorna uma lista de Lincenças por data de vencimento para serem
     * apresentadas num jTable
     * @return
     */
    public Vector<Licenca> consultaLicencasPorVencimento() {
        Vector relacaoLicencas = new Vector(slbgDao.listaVencimento());
        return relacaoLicencas;
    }
}
