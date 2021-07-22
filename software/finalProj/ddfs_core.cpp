#include "ddfs_core.h"

DDFSCore::DDFSCore(uint32_t core_base_addrs) {
  base_addr = core_base_addr;
  set_env_source(0);
  set_fow_source(0);
  set_pha_source(0);
  set_int_source(0);
  set_carrier_freq(55.0);
  set_offset_freq(0);
  set_phase_degree(0);
  set_table_interp(0);
  set_env(1.0);
}

DDFSCore::~DDFSCore(){};
void DDFSCore::set_carrier_freq(float freq) {
  uint32_t fcw, p2n;
  float tmp;

  p2n = 1<<(PHA_WIDTH-8);
}
