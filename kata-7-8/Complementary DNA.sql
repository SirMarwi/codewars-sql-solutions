select
  dna,
  translate(dna, 'ATCG', 'TAGC') as res
  
from dnastrand