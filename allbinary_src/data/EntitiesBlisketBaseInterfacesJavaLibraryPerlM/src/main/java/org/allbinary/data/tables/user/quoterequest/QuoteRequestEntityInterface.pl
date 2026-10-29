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
package org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::BasicDataTableInterface';



# throws Exception
sub get {
    my ($self, $userName, $id) = @_;
    die "abstract method get";
}


sub getIds {
    my ($self, $userName) = @_;
    die "abstract method getIds";
}


sub deleteWhere {
    my ($self, $key, $value) = @_;
    die "abstract method deleteWhere";
}


sub insert {
    my ($self, $values) = @_;
    die "abstract method insert";
}


sub update {
    my ($self, $userName, $updatedValues) = @_;
    die "abstract method update";
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::quoterequest::QuoteRequest;
use org::allbinary::data::tables::BasicDataTableInterface;

1;

