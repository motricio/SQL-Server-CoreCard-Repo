SELECT cluster_name, quorum_type_desc, quorum_state_desc FROM sys.dm_hadr_cluster
SELECT member_name, member_type_desc, member_state_desc, number_of_quorum_votes FROM sys.dm_hadr_cluster_members
