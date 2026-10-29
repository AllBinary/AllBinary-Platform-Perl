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

package org::allbinary::business::context::modules::storefront::StoreFrontData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::context::modules::storefront::StoreFrontData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{CANCEL} = "Cancel Store Front";
    $self->{SELECT} = "Select Store Front";
    $self->{INSTALL} = "Install Store Front";
    $self->{INSTALL_COMPLETE} = "Install Store Front Complete";
    $self->{NAME} = "STOREFRONT_NAME";
    $self->{CURRENTHOSTNAME} = "STOREFRONT_CURRENTHOSTNAME";
    $self->{CURRENTHOSTNAMEPATH} = "STOREFRONT_CURRENTHOSTNAMEPATH";
    $self->{CURRENTHOMEHOSTNAME} = "STOREFRONT_CURRENTHOMEHOSTNAME";
    $self->{CURRENTHOMEHOSTNAMEPATH} = "STOREFRONT_CURRENTHOMEHOSTNAMEPATH";
    $self->{HOMEHOSTNAME} = "STOREFRONT_HOMEHOSTNAME";
    $self->{HOMEHOSTNAMEPATH} = "STOREFRONT_HOMEHOSTNAMEPATH";
    $self->{HOSTNAME} = "STOREFRONT_HOSTNAME";
    $self->{HOSTNAMEPATH} = "STOREFRONT_HOSTNAMEPATH";
    $self->{TESTHOMEHOSTNAME} = "STOREFRONT_TESTHOMEHOSTNAME";
    $self->{TESTHOMEHOSTNAMEPATH} = "STOREFRONT_TESTHOMEHOSTNAMEPATH";
    $self->{TESTHOSTNAME} = "STOREFRONT_TESTHOSTNAME";
    $self->{TESTHOSTNAMEPATH} = "STOREFRONT_TESTHOSTNAMEPATH";
    $self->{IMAGEPATH} = "STOREFRONT_IMAGEPATH";
    $self->{STATICPATH} = "STOREFRONT_STATICPATH";
    $self->{CATEGORYPATH} = "STOREFRONT_CATEGORYPATH";
    $self->{INVENTORYCONTROL} = "STOREFRONT_INVENTORYCONTROL";
    $self->{CONFIGURATION} = "STOREFRONT_CONFIGURATION";
    $self->{SUBSTORES} = "STOREFRONT_SUBSTORES";
    $self->{TAGLOCATION} = "STOREFRONT_TAGLOCATION";
    $self->{PACKAGELOCATION} = "STOREFRONT_PACKAGELOCATION";
    $self->{FTP} = "STOREFRONT_FTP";
    $self->{FTPPATH} = "STOREFRONT_FTPPATH";
    $self->{FTPUSERNAME} = "STOREFRONT_FTPUSERNAME";
    $self->{FTPPASSWORD} = "STOREFRONT_FTPPASSWORD";
    $self->{TESTFTP} = "STOREFRONT_TESTFTP";
    $self->{TESTFTPPATH} = "STOREFRONT_TESTFTPPATH";
    $self->{TESTFTPUSERNAME} = "STOREFRONT_TESTFTPUSERNAME";
    $self->{TESTFTPPASSWORD} = "STOREFRONT_TESTFTPPASSWORD";
    $self->{SELECTSTORENAME} = "STOREFRONT_SELECTSTORENAME";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::context::modules::storefront::StoreFrontData::instance;
}


1;

