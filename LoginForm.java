package finalsprojectsystem;

import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.sql.*;

/**
 * LoginForm — Modern Aesthetic Design
 * Records every successful login to the `user_login_log` table
 */
public class LoginForm extends JFrame {

    JTextField     txtUser;
    JPasswordField txtPass;
    JButton        btnLogin, btnToRegister;
    JLabel         lblStatus;
    JPanel         cardPanel;

    // Modern Color Palette
    static final Color PRIMARY_DARK   = new Color(15, 23, 42);      // Slate 900
    static final Color PRIMARY        = new Color(59, 130, 246);    // Blue 500
    static final Color PRIMARY_LIGHT  = new Color(96, 165, 250);    // Blue 400
    static final Color ACCENT         = new Color(139, 92, 246);    // Violet 500
    static final Color SURFACE        = new Color(30, 41, 59);      // Slate 800
    static final Color SURFACE_LIGHT  = new Color(51, 65, 85);      // Slate 700
    static final Color TEXT_PRIMARY   = new Color(248, 250, 252);   // Slate 50
    static final Color TEXT_SECONDARY = new Color(148, 163, 184);   // Slate 400
    static final Color SUCCESS        = new Color(34, 197, 94);     // Green 500
    static final Color ERROR          = new Color(239, 68, 68);     // Red 500

    public LoginForm() {
        setTitle("POS System Login");
        setSize(480, 600);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setResizable(false);

        // Main panel with gradient background
        JPanel mainPanel = new JPanel(new BorderLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2d = (Graphics2D) g.create();
                g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, 
                    RenderingHints.VALUE_ANTIALIAS_ON);

                // Gradient background
                GradientPaint gp = new GradientPaint(
                    0, 0, PRIMARY_DARK,
                    getWidth(), getHeight(), new Color(30, 27, 75)
                );
                g2d.setPaint(gp);
                g2d.fillRect(0, 0, getWidth(), getHeight());

                // Decorative circles
                g2d.setColor(new Color(139, 92, 246, 30));
                g2d.fillOval(-50, -50, 200, 200);
                g2d.setColor(new Color(59, 130, 246, 20));
                g2d.fillOval(getWidth() - 150, getHeight() - 200, 250, 250);

                g2d.dispose();
            }
        };
        mainPanel.setBorder(BorderFactory.createEmptyBorder(40, 50, 40, 50));
        setContentPane(mainPanel);

        // ── Logo / Icon Section ─────────────────────────────────────────────
        JPanel logoPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        logoPanel.setOpaque(false);

        // Create a stylized icon
        JLabel lblIcon = new JLabel("") {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2d = (Graphics2D) g.create();
                g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON);

                // Circle background for icon
                g2d.setColor(new Color(139, 92, 246, 80));
                g2d.fillOval(0, 0, 70, 70);
                g2d.setColor(ACCENT);
                g2d.setStroke(new BasicStroke(2));
                g2d.drawOval(0, 0, 70, 70);

                g2d.dispose();
                super.paintComponent(g);
            }
        };
        lblIcon.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 32));
        lblIcon.setPreferredSize(new Dimension(70, 70));
        lblIcon.setHorizontalAlignment(SwingConstants.CENTER);
        lblIcon.setVerticalAlignment(SwingConstants.CENTER);
        logoPanel.add(lblIcon);

        // ── Title Section ───────────────────────────────────────────────────
        JPanel titlePanel = new JPanel();
        titlePanel.setLayout(new BoxLayout(titlePanel, BoxLayout.Y_AXIS));
        titlePanel.setOpaque(false);

        JLabel lblTitle = new JLabel("Welcome Back");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 32));
        lblTitle.setForeground(TEXT_PRIMARY);
        lblTitle.setAlignmentX(Component.CENTER_ALIGNMENT);

        JLabel lblSubtitle = new JLabel("Sign in to your POS account");
        lblSubtitle.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        lblSubtitle.setForeground(TEXT_SECONDARY);
        lblSubtitle.setAlignmentX(Component.CENTER_ALIGNMENT);

        titlePanel.add(lblTitle);
        titlePanel.add(Box.createRigidArea(new Dimension(0, 8)));
        titlePanel.add(lblSubtitle);

        // ── Card Panel (Glassmorphism effect) ───────────────────────────────
        cardPanel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2d = (Graphics2D) g.create();
                g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON);

                // Glass effect background
                g2d.setColor(new Color(30, 41, 59, 200));
                g2d.fillRoundRect(0, 0, getWidth(), getHeight(), 20, 20);

                // Border
                g2d.setColor(new Color(148, 163, 184, 50));
                g2d.setStroke(new BasicStroke(1));
                g2d.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 20, 20);

                g2d.dispose();
            }
        };
        cardPanel.setLayout(new BoxLayout(cardPanel, BoxLayout.Y_AXIS));
        cardPanel.setBorder(BorderFactory.createEmptyBorder(30, 30, 30, 30));
        cardPanel.setOpaque(false);

        // ── Username Field ──────────────────────────────────────────────────
        JLabel lblUser = new JLabel("Username");
        lblUser.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblUser.setForeground(TEXT_SECONDARY);
        lblUser.setAlignmentX(Component.LEFT_ALIGNMENT);

        txtUser = new JTextField() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2d = (Graphics2D) g.create();
                g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON);

                // Background
                g2d.setColor(SURFACE_LIGHT);
                g2d.fillRoundRect(0, 0, getWidth(), getHeight(), 12, 12);

                g2d.dispose();
                super.paintComponent(g);
            }
        };
        txtUser.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        txtUser.setForeground(TEXT_PRIMARY);
        txtUser.setCaretColor(PRIMARY_LIGHT);
        txtUser.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createLineBorder(new Color(71, 85, 105), 1),
            BorderFactory.createEmptyBorder(12, 15, 12, 15)
        ));
        txtUser.setMaximumSize(new Dimension(Integer.MAX_VALUE, 45));
        txtUser.setOpaque(false);

        // ── Password Field ──────────────────────────────────────────────────
        JLabel lblPass = new JLabel("Password");
        lblPass.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblPass.setForeground(TEXT_SECONDARY);
        lblPass.setAlignmentX(Component.LEFT_ALIGNMENT);

        txtPass = new JPasswordField() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2d = (Graphics2D) g.create();
                g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON);

                g2d.setColor(SURFACE_LIGHT);
                g2d.fillRoundRect(0, 0, getWidth(), getHeight(), 12, 12);

                g2d.dispose();
                super.paintComponent(g);
            }
        };
        txtPass.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        txtPass.setForeground(TEXT_PRIMARY);
        txtPass.setCaretColor(PRIMARY_LIGHT);
        txtPass.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createLineBorder(new Color(71, 85, 105), 1),
            BorderFactory.createEmptyBorder(12, 15, 12, 15)
        ));
        txtPass.setMaximumSize(new Dimension(Integer.MAX_VALUE, 45));
        txtPass.setOpaque(false);
        txtPass.setEchoChar('●');

        // ── Status Label ────────────────────────────────────────────────────
        lblStatus = new JLabel(" ");
        lblStatus.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblStatus.setForeground(ERROR);
        lblStatus.setAlignmentX(Component.CENTER_ALIGNMENT);

        // ── Login Button ────────────────────────────────────────────────────
        btnLogin = new JButton("Sign In") {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2d = (Graphics2D) g.create();
                g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON);

                // Gradient button
                GradientPaint gp = new GradientPaint(
                    0, 0, PRIMARY,
                    getWidth(), getHeight(), ACCENT
                );
                g2d.setPaint(gp);
                g2d.fillRoundRect(0, 0, getWidth(), getHeight(), 12, 12);

                // Text
                FontMetrics fm = g2d.getFontMetrics();
                String text = getText();
                int textX = (getWidth() - fm.stringWidth(text)) / 2;
                int textY = ((getHeight() - fm.getHeight()) / 2) + fm.getAscent();
                g2d.setColor(TEXT_PRIMARY);
                g2d.setFont(getFont());
                g2d.drawString(text, textX, textY);

                g2d.dispose();
            }
        };
        btnLogin.setFont(new Font("Segoe UI", Font.BOLD, 15));
        btnLogin.setForeground(TEXT_PRIMARY);
        btnLogin.setFocusPainted(false);
        btnLogin.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btnLogin.setMaximumSize(new Dimension(Integer.MAX_VALUE, 48));
        btnLogin.setPreferredSize(new Dimension(300, 48));
        btnLogin.setContentAreaFilled(false);
        btnLogin.setBorderPainted(false);

        // Hover effect
        btnLogin.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnLogin.setCursor(new Cursor(Cursor.HAND_CURSOR));
            }
        });

        // ── Register Link ───────────────────────────────────────────────────
        btnToRegister = new JButton("Don't have an account? Register") {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                // Underline effect
                if (getModel().isRollover()) {
                    Graphics2D g2d = (Graphics2D) g.create();
                    g2d.setColor(PRIMARY_LIGHT);
                    FontMetrics fm = g2d.getFontMetrics();
                    int textWidth = fm.stringWidth(getText());
                    int x = (getWidth() - textWidth) / 2;
                    int y = getHeight() - 5;
                    g2d.drawLine(x, y, x + textWidth, y);
                    g2d.dispose();
                }
            }
        };
        btnToRegister.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        btnToRegister.setForeground(TEXT_SECONDARY);
        btnToRegister.setAlignmentX(Component.CENTER_ALIGNMENT);
        btnToRegister.setBorderPainted(false);
        btnToRegister.setContentAreaFilled(false);
        btnToRegister.setFocusPainted(false);
        btnToRegister.setCursor(new Cursor(Cursor.HAND_CURSOR));

        // ── Assemble Card ───────────────────────────────────────────────────
        cardPanel.add(lblUser);
        cardPanel.add(Box.createRigidArea(new Dimension(0, 8)));
        cardPanel.add(txtUser);
        cardPanel.add(Box.createRigidArea(new Dimension(0, 18)));
        cardPanel.add(lblPass);
        cardPanel.add(Box.createRigidArea(new Dimension(0, 8)));
        cardPanel.add(txtPass);
        cardPanel.add(Box.createRigidArea(new Dimension(0, 8)));
        cardPanel.add(lblStatus);
        cardPanel.add(Box.createRigidArea(new Dimension(0, 20)));
        cardPanel.add(btnLogin);
        cardPanel.add(Box.createRigidArea(new Dimension(0, 18)));
        cardPanel.add(btnToRegister);

        // ── Assemble Main ───────────────────────────────────────────────────
        JPanel centerPanel = new JPanel();
        centerPanel.setLayout(new BoxLayout(centerPanel, BoxLayout.Y_AXIS));
        centerPanel.setOpaque(false);
        centerPanel.add(logoPanel);
        centerPanel.add(Box.createRigidArea(new Dimension(0, 15)));
        centerPanel.add(titlePanel);
        centerPanel.add(Box.createRigidArea(new Dimension(0, 25)));
        centerPanel.add(cardPanel);

        mainPanel.add(centerPanel, BorderLayout.CENTER);

        // ── Event Listeners ─────────────────────────────────────────────────
        btnLogin.addActionListener(e -> login());
        btnToRegister.addActionListener(e -> { new RegisterForm(); dispose(); });
        getRootPane().setDefaultButton(btnLogin);

        // Focus animation
        addFocusListenerToField(txtUser);
        addFocusListenerToField(txtPass);
    }

    private void addFocusListenerToField(JTextField field) {
        field.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                field.setBorder(BorderFactory.createCompoundBorder(
                    BorderFactory.createLineBorder(PRIMARY, 2),
                    BorderFactory.createEmptyBorder(12, 15, 12, 15)
                ));
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                field.setBorder(BorderFactory.createCompoundBorder(
                    BorderFactory.createLineBorder(new Color(71, 85, 105), 1),
                    BorderFactory.createEmptyBorder(12, 15, 12, 15)
                ));
            }
        });
    }

    // ──────────────────────────────────────────────────────────────────────────
    //  LOGIN LOGIC
    // ──────────────────────────────────────────────────────────────────────────
    private void login() {
        String user = txtUser.getText().trim();
        String pass = new String(txtPass.getPassword());

        if (user.isEmpty() || pass.isEmpty()) {
            lblStatus.setText("⚠ Please fill in all fields");
            shakeComponent(cardPanel);
            return;
        }

        // Loading state
        btnLogin.setText("Signing in...");
        btnLogin.setEnabled(false);

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(
                 "SELECT * FROM users WHERE username=? AND password=?")) {

            pst.setString(1, user);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");

                recordLoginEvent(user, conn);

                lblStatus.setText("Login successful!");
                lblStatus.setForeground(SUCCESS);

                // Small delay for visual feedback
                Timer timer = new Timer(800, e -> {
                    dispose();
                    if (role.equalsIgnoreCase("Cashier")) {
                        new CashierDashboard(user);
                    } else {
                        new Dashboard(user, role);
                    }
                });
                timer.setRepeats(false);
                timer.start();

            } else {
                lblStatus.setText("✗ Invalid username or password");
                lblStatus.setForeground(ERROR);
                shakeComponent(cardPanel);
                btnLogin.setText("Sign In");
                btnLogin.setEnabled(true);
            }

        } catch (Exception e) {
            lblStatus.setText("✗ Database error: " + e.getMessage());
            lblStatus.setForeground(ERROR);
            btnLogin.setText("Sign In");
            btnLogin.setEnabled(true);
        }
    }

    /**
     * Shake animation for error feedback
     */
    private void shakeComponent(JComponent component) {
        final int originalX = component.getLocation().x;
        final int originalY = component.getLocation().y;

        Timer shakeTimer = new Timer(30, null);
        final int[] count = {0};
        shakeTimer.addActionListener(e -> {
            int offset = (count[0] % 2 == 0) ? 5 : -5;
            component.setLocation(originalX + offset, originalY);
            count[0]++;
            if (count[0] >= 10) {
                component.setLocation(originalX, originalY);
                ((Timer) e.getSource()).stop();
            }
        });
        shakeTimer.start();
    }

    private void recordLoginEvent(String username, Connection conn) {
        try (PreparedStatement pst = conn.prepareStatement(
                "INSERT INTO user_login_log (username, login_time) " +
                "VALUES (?, NOW())")) {
            pst.setString(1, username);
            pst.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Login log warning: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | UnsupportedLookAndFeelException e) {
            e.printStackTrace();
        }

        SwingUtilities.invokeLater(() -> {
            new LoginForm().setVisible(true);
        });
    }
}