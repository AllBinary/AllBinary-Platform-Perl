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
package org::allbinary::data::tables::advertisement::areas::AdvertisementAreasEntityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::BasicDataTableInterface';



# throws Exception
sub get_j1 {
    my ($self, $storeName) = @_;
    die "abstract method get";
}


# throws Exception
sub get_j2 {
    my ($self, $storeName, $advertisementAreaName) = @_;
    die "abstract method get";
}

sub get {
    my ($invocant, @arguments) = @_;
    return $invocant->get_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->get_j2(@arguments) if scalar(@arguments) == 2;
    die "No method get takes " . scalar(@arguments) . " arguments";
}


sub delete {
    my ($self, $value) = @_;
    die "abstract method delete";
}


sub insert {
    my ($self, $values) = @_;
    die "abstract method insert";
}


sub update {
    my ($self, $updatedValues) = @_;
    die "abstract method update";
}

use java::util::HashMap ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::business::advertisement::area::AdvertisementAreaInterface ();
use org::allbinary::data::tables::BasicDataTableInterface ();

1;

