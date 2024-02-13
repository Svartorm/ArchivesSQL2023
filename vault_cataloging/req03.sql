select 
    filename, 
    least(rsa_time, hyper_pulse_time, quantum_x_time, aes_time, d_crypt_time) as best_time,
    greatest(rsa_time, hyper_pulse_time, quantum_x_time, aes_time, d_crypt_time) as worst_time

from dtf.madelines_files_results
order by filename collate "C";
