## Preparation tasks (done before the lab at home)

1. Write characteristic equations and complete truth tables for D, JK, T flip-flops where `q(n)` represents main output value before the clock edge and `q(n+1)` represents value after the clock edge.

![Characteristic equations](images05ffs.png)
!--
begin{align}
    q_{n+1}^D =&~ 
    q_{n+1}^{JK} =&
    q_{n+1}^T =&
end{align}
--

    clk  d  q(n)  q(n+1)  Comments 
    -  -  -  -  -- 
    ![rising](imageseq_uparrow.png)  0  0  0  No change 
    ![rising](imageseq_uparrow.png)  0  1  0  Invert 
    ![rising](imageseq_uparrow.png)  1  0  1  Invert 
    ![rising](imageseq_uparrow.png)  1  1  1  No change 

    clk  j  k  q(n)  q(n+1)  Comments 
    -  -  -  -  -  -- 
    ![rising](imageseq_uparrow.png)  0  0  0  0  No change 
    ![rising](imageseq_uparrow.png)  0  0  1  1  No change 
    ![rising](imageseq_uparrow.png)  0  1  0  0  Reset 
    ![rising](imageseq_uparrow.png)  0  1  1  0  Reset 
    ![rising](imageseq_uparrow.png)  1  0  0  1  Set 
    ![rising](imageseq_uparrow.png)  1  0  1  1  Set 
    ![rising](imageseq_uparrow.png)  1  1  0  1  Toggle 
    ![rising](imageseq_uparrow.png)  1  1  1  0  Toggle 

    clk  t  q(n)  q(n+1)  Comments 
    -  -  -  -  -- 
    ![rising](imageseq_uparrow.png)  0  0  0  No change 
    ![rising](imageseq_uparrow.png)  0  1  1  No change 
    ![rising](imageseq_uparrow.png)  1  0  1  Toggle 
    ![rising](imageseq_uparrow.png)  1  1  0  Toggle 

!--
Dokreslit průběhy pro D-latch a D-type FF.
