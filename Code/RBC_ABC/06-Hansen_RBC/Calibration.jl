using Plots
theme(:juno)

## 参数定义

### β, δ, θ, λ_bar, γ

global β = 0.99
global δ = 0.025
global θ = 0.36
global λ_bar = 1
global γ = 0.95

### H_bar, A

function get_H_bar(A)
    m1 = 1 - (β*δ*θ)/(1 - β*(1-δ))
    return 1/(1 + A/(1-θ) * m1)
end

A_list = collect(1:0.01:3)
H_bar_list = get_H_bar.(A_list)
plot(A_list, H_bar_list, lw=3, label="H")
hline!([1/3], linestyle=:dash, lw=3, label="H=1/3")
H_idx = argmin(abs.(H_bar_list .- 1/3))

global H_bar = H_bar_list[H_idx]
global A = A_list[H_idx]

### K_bar, Y_bar, C_bar, r_bar

global K_bar = H_bar * ((θ*λ_bar)/(1/β - (1-δ)))^(1/(1-θ))
global Y_bar = K_bar^θ * H_bar^(1-θ)
global C_bar = Y_bar - δ * K_bar
global r_bar = 1/β - (1-δ)


## 模型中的矩阵

A = [0, -K_bar, 0, 0]
B = [0, (1-δ)*K_bar, θ, -1]
C = [
    1 -1 -1/(1-H_bar) 0;
    Y_bar -C_bar 0 0;
    -1 0 1-θ 0;
    1 0 0 -1
]
D = [0, 0, 1, 0]
F = 0
G = 0
H = 0
J = [0, -1, 0, β*r_bar]
K = [0, 1, 0, 0]
L = 0
M = 0
N = γ


## 求解模型

### 解P

using Roots

P2 = F - J' * inv(C) * A
P1 = -(J' * inv(C) * B - G + K' * inv(C) * A)
P0 = -(K' * inv(C) * B) + H

f_P(x) = P2 * x^2 + P1 * x + P0
Ps = find_zeros(f_P, 0, 2)
print(Ps)
P = Ps[1]

### 解R

R = -inv(C) * (A * P + B)

### 解Q

QL = N * (F - (J'*inv(C)*A)) + (J'*R + F*P + G - K'*inv(C)*A)
QR = (J'*inv(C)*D - L) * N + K'*inv(C)*D - M
Q = QR/QL

### 解S

S = -inv(C)*(A*Q + D)
