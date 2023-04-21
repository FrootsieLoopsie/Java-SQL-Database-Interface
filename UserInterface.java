
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class UserInterface {
    private JFrame frame;
    private JButton[] queryButtons;
    private DatabaseQuery[] databaseQueries;
    private int numQueries;

    public UserInterface() {
        this.frame = new JFrame();
        this.frame.setSize(40 + 4 * 150, 300);

        this.queryButtons = new JButton[4];
        this.databaseQueries = new DatabaseQuery[4];
        this.numQueries = 0;

        this.frame.setLayout(null);
        this.frame.setVisible(true);
    }

    public DatabaseQuery getQueryOf(JButton queryButton) {
        for(int i = 0; i < this.numQueries; i++) {
            if(this.queryButtons[i] == queryButton) return this.databaseQueries[i];
        }
        return null;
    }

    public void setOutputMessage(String text) {
        System.out.println(text);
    }

    public void addButton(DatabaseQuery query, String buttonName) {
        int i = this.numQueries % queryButtons.length;
        this.numQueries++;
        this.databaseQueries[i] = query;
        this.queryButtons[i] = new JButton(buttonName);

        // Set the size and position:
        this.queryButtons[i].setBounds(20 + (150 * i), 40, 140, 40);
        this.queryButtons[i].setVisible(true);
        this.frame.add(this.queryButtons[i]);

        // Set the resulting action:
        this.queryButtons[i].addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                DatabaseQuery query = Main.UI.getQueryOf((JButton) e.getSource());
                Main.UI.setOutputMessage(query.getOutput());
            }
        });
    }
}
