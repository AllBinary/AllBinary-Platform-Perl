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

package org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{ITEM} = "BASICITEM";
    $self->{TOTAL} = "BASICITEM_TOTAL";
    $self->{ID} = "BASICITEM_ID";
    $self->{NUMBER} = "BASICITEM_NUMBER";
    $self->{INBASKETS} = "BASICITEM_IN_BASKETS";
    $self->{WEIGHT} = "BASICITEM_WEIGHT";
    $self->{NEWORUSED} = "BASICITEM_NEW_OR_USED";
    $self->{SUMMARY} = "BASICITEM_SUMMARY";
    $self->{DISTRIBUTOR} = "BASICITEM_DISTRIBUTOR";
    $self->{IDUSEDBYDISTRIBUTOR} = "BASICITEM_IDUSEDBYDISTRIBUTOR";
    $self->{PRODUCEDBY} = "BASICITEM_PRODUCEDBY";
    $self->{PRODUCTIONDATE} = "BASICITEM_PRODUCTIONDATE";
    $self->{STARTPRODUCTIONDATE} = "BASICITEM_STARTPRODUCTIONDATE";
    $self->{DESCRIPTION} = "BASICITEM_DESCRIPTION";
    $self->{KEYWORDS} = "BASICITEM_KEYWORDS";
    $self->{CATEGORY} = "BASICITEM_CATEGORY";
    $self->{TYPE} = "BASICITEM_TYPE";
    $self->{IMAGE} = "BASICITEM_IMG";
    $self->{SMALLIMAGE} = "BASICITEM_SMALL_IMG";
    $self->{MEDIUMIMAGE} = "BASICITEM_MEDIUM_IMG";
    $self->{LARGEIMAGE} = "BASICITEM_LARGE_IMG";
    $self->{PRICE} = "BASICITEM_PRICE";
    $self->{COMMENT} = "BASICITEM_COMMENT";
    $self->{CUSTOMS} = "BASICITEM_CUSTOMS";
    $self->{DOWNLOADS} = "BASICITEM_DOWNLOADS";
    $self->{GROUPS} = "BASICITEM_GROUPS";
    $self->{OPTIONS} = "BASICITEM_OPTIONS";
    $self->{PERMISSIONS} = "BASICITEM_PERMISSIONS";
    $self->{SPECIALS} = "BASICITEM_SPECIALS";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::inventory::item::BasicItemData::instance;
}


1;

