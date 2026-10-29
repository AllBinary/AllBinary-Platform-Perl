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

# Java interface
package org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub delete {
    my ($self, $evt) = @_;
    die "abstract method delete";
}


# throws Exception
sub duplicate {
    my ($self, $evt) = @_;
    die "abstract method duplicate";
}


sub select {
    my ($self, $evt) = @_;
    die "abstract method select";
}


sub rotate {
    my ($self, $evt) = @_;
    die "abstract method rotate";
}


sub explode {
    my ($self, $evt) = @_;
    die "abstract method explode";
}


# throws Exception
sub autoExplode {
    my ($self, $evt) = @_;
    die "abstract method autoExplode";
}


# throws Exception
sub center {
    my ($self, $evt) = @_;
    die "abstract method center";
}


1;

