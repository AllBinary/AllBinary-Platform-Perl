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

package org::allbinary::business::category::CategoryData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::business::category::CategoryData'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{PARENT} = "CATEGORY_PARENT";
    $self->{NAME} = "CATEGORY_NAME";
    $self->{PATH} = "CATEGORY_PATH";
    $self->{LABEL} = "CATEGORY_LABEL";
    $self->{VIEW} = "CATEGORY_VIEW_CATEGORY";
    $self->{LEVEL} = "CATEGORY_LEVEL";
    $self->{REQUEST} = "request";
    $self->{ROOTCATEGORY} = "Category";
    $self->{UNCRYPTED_EXTENSION} = 'org::allbinary::logic::io::file::CommonDataFileStrings'->getInstance()->{UNCRYPTED_EXTENSION};
    $self->{ENCRYPTED_EXTENSION} = 'org::allbinary::logic::io::file::CommonDataFileStrings'->getInstance()->{ENCRYPTED_EXTENSION};
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::category::CategoryData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::io::file::CommonDataFileStrings ();

1;

