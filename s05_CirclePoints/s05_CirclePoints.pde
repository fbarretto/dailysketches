import java.util.List;
Circle control;
List<Circle> circles;
List<Circle> circlesControl;
int numCircles = 4;

void setup() {
  size(1024, 1024);

  control = new Circle(numCircles, 200, 0.001, 0);
  circles = new ArrayList<Circle>();
  circlesControl = new ArrayList<Circle>();

  for (int i=0; i<numCircles; i++) {
    Circle c = new Circle(40, 300, 0.005 * (-1 + (int)random(2) * 2), 10);
    circles.add(c);

    c = new Circle(40, 300, 0.002 * (-1 + (int)random(2) * 2), 10);
    circlesControl.add(c);
  }
}


void draw() {
  background(0);
  control.update(new PVector(width/2, height/2));

  for (int i=0; i<circles.size(); i++) {
    Circle c = circles.get(i);
    c.update(control.points.get(i).pos);

    //c.render();

    c = circlesControl.get(i);
    c.update(control.points.get(i).pos);


    //c.render();
  }

  for (int i=0; i<circles.get(0).points.size(); i++) {
    strokeWeight(2);
    stroke(255);
    noFill();
    bezier(circles.get(0).points.get(i).pos.x, circles.get(0).points.get(i).pos.y, 
      circlesControl.get(1).points.get(i).pos.x, circlesControl.get(1).points.get(i).pos.y, 
      circlesControl.get(2).points.get(i).pos.x, circlesControl.get(2).points.get(i).pos.y, 
      circles.get(3).points.get(i).pos.x, circles.get(3).points.get(i).pos.y);

    bezier(circles.get(0).points.get(i).pos.x, circles.get(0).points.get(i).pos.y, 
      circlesControl.get(2).points.get(i).pos.x, circlesControl.get(2).points.get(i).pos.y, 
      circlesControl.get(1).points.get(i).pos.x, circlesControl.get(1).points.get(i).pos.y, 
      circles.get(3).points.get(i).pos.x, circles.get(3).points.get(i).pos.y);


    //line(circles.get(1).points.get(i).pos.x, circles.get(1).points.get(i).pos.y,
    //circles.get(3).points.get(i).pos.x, circles.get(3).points.get(i).pos.y);
  }
}