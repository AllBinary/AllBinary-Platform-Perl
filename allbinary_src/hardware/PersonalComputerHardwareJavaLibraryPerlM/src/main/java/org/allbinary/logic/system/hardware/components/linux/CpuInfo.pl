#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::system::hardware::components::linux::CpuInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $PROCESSOR = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("processor");
our $VENDORID = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("vendor_id");
our $CPUFAMILY = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("cpu family");
our $MODEL = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("model");
our $MODELNAME = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("model name");
our $STEPPING = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("stepping");
our $CPUMHZ = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("cpu MHz");
our $CACHESIZE = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("cache size");
our $FDIVBUG = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("fdiv_bug");
our $HLTBUG = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("hlt_bug");
our $F00FBUG = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("f00f_bug");
our $COMABUG = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("coma_bug");
our $FPU = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("fpu");
our $FPUEXCEPTION = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("fpu_exception");
our $CPUIDLEVEL = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("cache size");
our $WP = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("yes");
our $FLAGS = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("flags");
our $BOGOMIPS = 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("bogomips");

sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
}


sub new {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
    return $self;
}


sub toString {
    my ($self) = @_;
        return $self->{name};
}


1;

