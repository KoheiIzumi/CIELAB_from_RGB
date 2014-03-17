/**************************
No.021
Convert CIELAB from RGB.

@Author Kohei Izumi
@Since 2014.03.17
**************************/
import java.awt.*;
import javax.swing.*;

void setup()
{
  double r0, g0, b0;
  double r, g, b;
  double x, y, z;
  double l = 0;
  double a = 0;
  double b1 = 0;
  double fx, fy, fz;
  
  double xn = 95.045;
  double yn = 100;
  double zn = 108.892;
  
  JPanel panel = new JPanel();
  BoxLayout layout = new BoxLayout(panel, BoxLayout.Y_AXIS);
  panel.setLayout(layout);
  
  panel.add(new JLabel("Red"));
  JTextField text_R = new JTextField();
  JLabel label_R = new JLabel("Green");
  JTextField text_G = new JTextField();
  JLabel label_G = new JLabel("Blue");
  JTextField text_B = new JTextField();
  
  panel.add(text_R);
  panel.add(label_R);
  panel.add(text_G);
  panel.add(label_G);
  panel.add(text_B);
  
  int dialog = JOptionPane.showConfirmDialog(null, panel, "CIELAB from RGB", JOptionPane.OK_CANCEL_OPTION);
  
  r0 = Double.valueOf(text_R.getText()) / 255.;
  g0 = Double.valueOf(text_G.getText()) / 255.;
  b0 = Double.valueOf(text_B.getText()) / 255.;
  
  r = Math.pow(r0, 2.2);
  g = Math.pow(g0, 2.2);
  b = Math.pow(b0, 2.2);
  
  x = (0.3933*r + 0.3651*g + 0.1903*b) * 100;
  y = (0.2123*r + 0.7010*g + 0.0858*b) * 100;
  z = (0.0182*r + 0.1117*g + 0.9570*b) * 100;
  
  //Described in OpenCV
  /*x = 0.412453*r + 0.357580*g + 0.180423*b;
  y = 0.212671*r + 0.715160*g + 0.072169*b;
  z = 0.019334*r + 0.119193*g + 0.950227*b;*/

  print("x:" +x+ ", y:" +y+ ", z" +z+ "\n");

  l = (116 * Math.pow(y/yn, 0.333)) - 16;
  a = 500 * (Math.pow(x/xn, 0.333) - Math.pow(y/yn, 0.333));
  b1 = 200 * (Math.pow(y/yn, 0.333) - Math.pow(z/zn, 0.333));
  
  print("l:" +l+ ", a:" +a+ ", b:" +b1+ "\n");
  
  noLoop();
}

void draw(){
  System.exit(0);
}
