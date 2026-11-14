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
use parent -norequire,'java::lang::Object';

tie our $PROCESSOR, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("processor") };
tie our $VENDORID, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("vendor_id") };
tie our $CPUFAMILY, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("cpu family") };
tie our $MODEL, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("model") };
tie our $MODELNAME, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("model name") };
tie our $STEPPING, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("stepping") };
tie our $CPUMHZ, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("cpu MHz") };
tie our $CACHESIZE, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("cache size") };
tie our $FDIVBUG, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("fdiv_bug") };
tie our $HLTBUG, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("hlt_bug") };
tie our $F00FBUG, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("f00f_bug") };
tie our $COMABUG, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("coma_bug") };
tie our $FPU, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("fpu") };
tie our $FPUEXCEPTION, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("fpu_exception") };
tie our $CPUIDLEVEL, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("cache size") };
tie our $WP, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("yes") };
tie our $FLAGS, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("flags") };
tie our $BOGOMIPS, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::components::linux::CpuInfo'->new("bogomips") };

sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
}


sub new {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{name} = $name;
    return $self;
}


sub toString {
    my ($self) = @_;
        return $self->{name};
}

use java::lang::Object ();
use java::lang::LazyStatic ();

1;

