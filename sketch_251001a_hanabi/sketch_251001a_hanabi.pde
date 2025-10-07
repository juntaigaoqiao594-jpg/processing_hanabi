ArrayList<Particle> particles;

void setup() {
  size(400, 300);
  particles = new ArrayList<Particle>();
  noStroke();
}

void draw() {
  // 残像が残る
  fill(0, 40);         // 0=黒、４０＝半透明
  rect(0, 0, width, height); //(画面全体に四角形をかく)

  // すべての粒を動かして描画
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i); //i番目の粒を取り出す
    p.update();                    //粒を動かす
    p.display();                   //粒を画面にかく

    // 寿命が尽きたら消す
    if (p.lifespan <= 0) {
      particles.remove(i);
    }
  }
}

void mousePressed() {
  for (int i = 0; i < 100; i++) {  //粒の数
    float vx = random(-4, 4);  // X方向の速さをランダムに
    float vy = random(-4, 4);  // Y方向の速さをランダムに
    particles.add(new Particle(mouseX, mouseY, vx, vy));
  }
}


// 粒クラス
class Particle {
  float x, y;  //粒の位置
  float vx, vy;  //粒の速さ
  float lifespan = 255;//粒の寿命
  float r, g, b;

  Particle(float x_, float y_, float vx_, float vy_) {
    x = x_;
    y = y_;
    vx = vx_;
    vy = vy_;
    //粒ごとにランダムに色を決める
    r = random(255);
    g = random(255);
    b = random(255);
  }

  void update() {
    x += vx;
    y += vy;
    vy += 0.05;     // 重力
    lifespan -= 3;  // 寿命を減らす
  }

  void display() {
    fill(r, g, b, lifespan);
    ellipse(x, y, 5, 5);
  }
}
