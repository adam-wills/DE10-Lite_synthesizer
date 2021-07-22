#ifndfef _DDFS_H_INCLUDED
#define _DDFS_H_INCLUDED
#define SYS_CLK_FREQ = 48000.0000

class DDFSCore {
    enum {
        FCW_REG      = 0,
        FOW_REG      = 1,
        PHA_REG      = 2,
        ENV_REG      = 3,
        INT_REG      = 4,
        SRC_SEL_REG  = 5
    };
    enum {PHA_WIDTH = 32};

  public:
    DDFSCore(uint32_t core_base_addr);
    ~DDFSCore();
    void set_carrier_freq(int freq);
    void set_offset_freq(int freq);
    void set_phase_degree(int phase);
    void set_env(int env); // float env?
    void set_table_interp(float interp)
    void set_fow_source(int channel);
    void set_env_source(int channel);
    void set_pha_source(int channel);
    void set_int_source(int channel);
  private:
    uint32_t base_addr;
    uint32_t ch_select_reg;
};

#endif  // _DDFS_H_INCLUDED
