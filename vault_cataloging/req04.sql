select 
    round(avg(coalesce(nullif(rsa_time, 0), max.rsa))::numeric, 2) as avg_rsa_time,
    round(avg(coalesce(nullif(hyper_pulse_time,0), max.hyper))::numeric, 2) as avg_hyper_pulse_time,
    round(avg(coalesce(nullif(quantum_x_time,0), max.quantum))::numeric, 2) as avg_quantum_x_time,
    round(avg(coalesce(nullif(aes_time,0), max.aes))::numeric, 2) as avg_aes_time,
    round(avg(coalesce(nullif(d_crypt_time,0), max.d))::numeric, 2) as avg_d_crypt_time

from dtf.madelines_files_results, (
    select 
        max(rsa_time) as rsa,
        max(hyper_pulse_time) as hyper,
        max(quantum_x_time) as quantum,
        max(aes_time) as aes,
        max(d_crypt_time) as d
    from dtf.madelines_files_results
)as max;

