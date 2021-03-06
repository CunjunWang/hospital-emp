SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP Database if exists hospital;
CREATE Database hospital;
USE hospital;
alter database hospital character set 'utf8mb4';

create table if not exists h_patient (
  id                     bigint auto_increment
  comment '主键'
    primary key,
  patient_name           varchar(200)                       null
  comment '病人姓名',
  patient_gender         int                                null
  comment '病人性别',
  patient_age            int                                null
  comment '病人年龄',
  patient_account_number bigint                             null
  comment '病人账号',
  is_del                 tinyint default '0'                null
  comment '逻辑删除标识符 0-未删除 1-已删除',
  patient_status         int                                null
  comment '病人状态',
  create_time            datetime default CURRENT_TIMESTAMP null
  comment '创建时间',
  create_by              bigint                             null
  comment '创建人账号Id',
  update_time            datetime default CURRENT_TIMESTAMP null
  comment '更新时间',
  update_by              bigint                             null
  comment '更新人账号Id',
  patient_uuid           varchar(200)                       null
  comment '病人UUID'
) comment '病人表';

create table if not exists h_staff (
  id                bigint auto_increment
  comment '主键'
    primary key,
  staff_uuid        varchar(200)                       null
  comment '职员UUID',
  staff_name        varchar(200)                       null
  comment '职员姓名',
  staff_age         int                                null
  comment '职员年龄',
  staff_department  bigint default '0'                 not null
  comment '职员部门编号',
  staff_type        int                                null
  comment '职员类型 0-医生 1-护士',
  staff_gender      int                                null
  comment '职员性别',
  staff_is_on_job   tinyint default '1'                null
  comment '是否在职 0-不在职 1-在职',
  staff_experience  int                                null
  comment '工作年限',
  staff_description varchar(200)                       null
  comment '职员描述',
  is_del            tinyint default '0'                null
  comment '逻辑删除标识符 0-未删除 1-已删除',
  create_time       datetime default CURRENT_TIMESTAMP null
  comment '创建时间',
  create_by         bigint                             null
  comment '创建人Id',
  update_time       datetime default CURRENT_TIMESTAMP null
  comment '更新时间',
  update_by         bigint                             null
  comment '更新人Id'
) comment '职员表';

create table if not exists h_medicine (
  id                   bigint auto_increment
  comment '主键'
    primary key,
  medicine_name        varchar(200)                       null
  comment '药品名称',
  medicine_description varchar(200)                       null
  comment '药品描述',
  medicine_price       decimal(14,2)                      null
  comment '药品价格',
  medicine_stock       bigint default '0'                 null
  comment '药品库存',
  medicine_type        tinyint                            null
  comment '药品类型 0-非处方药 1-处方药',
  is_del               tinyint default '0'                null
  comment '逻辑删除标识符 0-未删除 1-已删除',
  create_time          datetime default CURRENT_TIMESTAMP null
  comment '创建时间',
  create_by            bigint                             null
  comment '创建人Id',
  update_time          datetime default CURRENT_TIMESTAMP null
  comment '更新时间',
  update_by            bigint                             null
  comment '更新人Id'
) comment '药品表';

create table if not exists h_ward (
  id               bigint auto_increment
  comment '主键'
    primary key,
  ward_room_number bigint                             null
  comment '病房号',
  ward_floor       bigint                             null
  comment '病房所在楼层',
  ward_capacity    int                                null
  comment '病房容纳病人数',
  is_del           tinyint default '0'                null
  comment '逻辑删除标识符 0-未删除 1-已删除',
  create_date      datetime default CURRENT_TIMESTAMP null
  comment '创建时间',
  create_by        bigint                             null
  comment '创建人Id',
  update_time      datetime default CURRENT_TIMESTAMP null
  comment '更新时间',
  update_by        bigint                             null
  comment '更新人Id',
  ward_type        bigint                             null
  comment '病房类型'
) comment '病房表';
