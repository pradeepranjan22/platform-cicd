import {
  to = aws_eks_addon.vpc_cni
  id = "lab-10-12-eks:vpc-cni"
}

import {
  to = aws_eks_addon.coredns
  id = "lab-10-12-eks:coredns"
}

import {
  to = aws_eks_addon.pod_identity_agent
  id = "lab-10-12-eks:eks-pod-identity-agent"
}