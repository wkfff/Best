/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.best.slbg.util;

import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author marcelo
 */
public class Utilitario {

    public static void transformaMaicuscula(java.awt.event.KeyEvent evt) {
        JTextField tf = (JTextField) evt.getComponent();
        if (evt.getKeyCode() != 32 & evt.getKeyCode() != 8 & evt.getKeyCode() != 37 & evt.getKeyCode() != 39) {
            tf.setText(tf.getText().toUpperCase());
        }
    }

    /**
     * Método para adicionar uma nova linha na JTable
     */
    public void adicionaLinha(JTable tabela) {
        // Obtem o modelo da JTable
        DefaultTableModel modelo = retornaModeloTabela(tabela);
        // Adiciona uma nova linha em branco no modelo
        modelo.addRow(new String[]{"", ""});
    }

    /**
     * Método que retorna um objeto Model de uma Tabela.
     * @param tabela
     * @return
     */
    public DefaultTableModel retornaModeloTabela(JTable tabela) {
        // Obtem o modelo da JTable
        tabela.editingStopped(null);
        return (DefaultTableModel) tabela.getModel();
    }

    /**
     * Método que retorna uma linha selecionada
     *
     * @param tabela
     * @return
     */
    public int retornaLinhaTabela(JTable tabela) {
        return tabela.getSelectedRow();
    }
    
}
