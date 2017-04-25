# ESXi configuration notes for ECX Host Clustering
- All the nodes in vMA Cluster and iSCSI Cluster should be configured to boot automatically when ESXi starts.
- The network for iSCSI and Data Mirroring should use physically indepenent netowrk if possible. Configure logically independent at least.
- Add VMkernel port for iSCSI communication.
- Try to invalidate TSO, LRO and Jumbo Frame if iSCSI performance is not enough.
- Configure ssh service to start automatically when ESXi start.


- genw-remote-node in vMA Cluster periodically executes "power on" for another vMA VM. And so, "suspend" the genw-remote-node before when intentionally shutdown the vMA VM
- genw-remote-node in vMA Cluster periodically executes "starting cluster service" for another vMA VM. And so, "suspend" the genw-remote-node before when intentionally stop the cluster service.


<!--
- vMA VM, iSCSI VM �̎����N���ݒ�
- iSCSI network �� mirror network �̕���
- iSCSI�p VMkernel port �̒ǉ�
- TSO, LRO, Jumbo frame �̖�����
- ssh �T�[�r�X�̎����N���ݒ�
- vMA Cluster �� genw-remote-node ��
  - �Ό� vMA VM �� power off status ��F������� power on �����s����B�]���āA�Ӑ}�I�� vMA VM �� power off ��Ԃɂ���Ƃ��́AvMA Cluster �� genw-remote-node �� suspend ����K�v������B
  - �Ό� vMA VM �� EC�T�[�r�X �� offline status ��F������� service start �����s����B�]���āA�Ӑ}�I�� EC�T�[�r�X �� offline status �ɂ���Ƃ��́AvMA Cluster �� genw-remote-node �� suspend ����K�v������B
-->
