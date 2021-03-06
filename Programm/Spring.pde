// A class that represents a physical mass point (classical mechanics)
//
// used global variables: 
// float dt  -   the time interval that is used when accel and move are called
// 
class Spring {
  // The idea of the spring:
  // linear force law for the spring:
  // from  F = -D * s
  // here: F = - D * (getLength() - springLength) 
  // spring constant in N/m
  float D;
  // spring normal length (F=0) 
  float springLength;
  // location of spring ends
  PVector r0;
  PVector r1;
  
  // constructor
  // all properties of the springs have to be given:
  // x0,y0 = start point
  // x1,y1 = end point
  // l normal length im m
  // d spring constant in N/m
  Spring(float x0, float y0, float x1, float y1, float l, float d) {
    D = d;
    springLength = l;
    r0 = new PVector();
    r1 = new PVector();
    r0.set(x0,y0,0);
    r1.set(x1,y1,0);
  }
  
  // calculate the current length of the spring in m (scalar)
  float getLength() {
    PVector d = new PVector();
    d.set(r1).sub(r0);
    return d.mag();
  }
  
  // calculate the current force of the spring due to its length and orientation in N (vector)
  PVector getForce() {
    PVector f = new PVector();
    // direction of Force: along the spring
    // create a normalized vector in spring direction
    // f = r1 - r0 (vectors!
    f.set(r1);
    f.sub(r0);
    // keep orientation, but change length to 1
    f.normalize();
    // Calculate the magnitude of the spring force and
    // scale the force vector accordingly
    // F = - D * (s - s0) 
    f.mult(-1.0*D*(this.getLength()-springLength));
    // return the result vector
    return f;
  }
  
  // set the position of the end point of the spring
  void setR0(PVector r) {
    r0.set(r);
  }
  
  // set the position of the end point of the spring
  void setR1(PVector r) {
    r1.set(r);
  }

  // draw the string as straight line
  void draw() {
    line(r0.x, r0.y, r1.x, r1.y);
  }
}
