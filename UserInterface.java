
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class UserInterface {
    private JFrame frame;
    private JButton[] queryButtons;
    private DatabaseQuery[] databaseQueries;
    private int numQueries;

    public UserInterface(int maxNumQueries) {
        this.frame = new JFrame();
        this.queryButtons = new JButton[maxNumQueries];
        this.databaseQueries = new DatabaseQuery[maxNumQueries];
        this.numQueries = 0;
    }

    public UserInterface() {
        this.frame = new JFrame();
        this.queryButtons = new JButton[4];
        this.databaseQueries = new DatabaseQuery[4];
        this.numQueries = 0;
    }

    public DatabaseQuery getQueryOf(JButton queryButton) {
        for(int i = 0; i < this.numQueries; i++) {
            if(this.queryButtons[i] == queryButton) return this.databaseQueries[i];
        }
        return null;
    }

    public void setOutputMessage(String text) {

    }

    public void addButtonFor(DatabaseQuery query, String buttonName) {
        int i = this.numQueries % queryButtons.length;
        this.numQueries++;
        this.databaseQueries[i] = query;
        this.queryButtons[i] = new JButton(buttonName);
        this.queryButtons[i].doClick();;
        this.queryButtons[i].addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                DatabaseQuery query = Main.UI.getQueryOf((JButton) e.getSource());
                Main.UI.setOutputMessage(query.getOutput());
            }
        });
    }
}
