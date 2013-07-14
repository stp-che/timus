N = gets.to_i
M = []
ALPHA = []
N.times{ M << gets.split.map(&:to_f) }
DEGREE = Math::PI/180
N.times{ ALPHA << DEGREE*gets.to_f }

angles_sum = ALPHA.inject(&:+)

A = []

def Mx(i); M[i][0]; end
def My(i); M[i][1]; end

cos_b = Math.cos(angles_sum)
sin_b = Math.sin(angles_sum)

sx = -Mx(0)*cos_b + My(0)*sin_b + Mx(N-1)
sy = -My(0)*cos_b - Mx(0)*sin_b + My(N-1)

(0..N-2).each do |i|
  angle = ALPHA[i+1..N-1].inject(&:+)
  cos = Math.cos(angle)
  sin = Math.sin(angle)
  sx += (Mx(i)-Mx(i+1))*cos - (My(i)-My(i+1))*sin
  sy += (My(i)-My(i+1))*cos + (Mx(i)-Mx(i+1))*sin
end

A[0] = [
  (-sin_b/(1-cos_b)*sy + sx)/2,
  (sin_b/(1-cos_b)*sx + sy)/2
]

(1..N-1).each do |i|
  cos = Math.cos(ALPHA[i-1])
  sin = Math.sin(ALPHA[i-1])
  A[i] = [
    A[i-1][0]*cos - A[i-1][1]*sin + Mx(i-1)*(1-cos) + My(i-1)*sin,
    A[i-1][1]*cos + A[i-1][0]*sin + My(i-1)*(1-cos) - Mx(i-1)*sin
  ]
end

def formated(val)
  ('%0.2f' % val).sub(/(0|\.00)$/, '')
end

A.each{|a| puts "#{formated(a[0])} #{formated(a[1])}"}
