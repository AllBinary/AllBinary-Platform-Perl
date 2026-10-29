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

package org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $userNameEvenNameHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
our $nextId = 0;
our $INSTALLER = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Installer");
our $EXCEPTION = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Exception");
our $LOGGEDEXCEPTION = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Logged Exception");
our $ERROR = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Error");
our $OUTOFMEMORY = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Out Of Memory Error");
our $ADMINGENERATINGSTATICPAGES = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Admin Generating Static Pages");
our $STOREERROROCCURRED = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Error Occurred");
our $STOREOUTOFMEMORY = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Out Of Memory Error");
our $STORECREATED = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Created");
our $STOREOPENED = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Opened");
our $STORECLOSED = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Closed");
our $STOREGENERATINGSTATICPAGES = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Generating Static Pages");
our $PRODUCTISOUT = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Product Is Out");
our $PRODUCTISAVAILABLE = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Product Is Available");
our $PRODUCTISOLD = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Product Is Old");
our $PRODUCTISONSALE = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Product Is On Sale");
our $PRODUCTSALEISOVER = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Product Sale Is Over");
our $ORDERPREPROCESSING = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSING);
our $ORDERPROCESSING = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PROCESSING);
our $ORDERCANCELLED = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLED);
our $ORDERPARTIALLYSHIPPED = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PARTIALLYSHIPPED);
our $ORDERSHIPPED = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPED);
our $QUOTEREQUEST = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Quote Request");
our $NEWPASSWORD = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("New Password");

sub _init_fields {
    my ($self) = @_;
    $self->{eventNameId} = 0;
    $self->{eventHandlerName} = undef;
}


sub new {
    my ($class, $eventHandlerName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{eventHandlerName} = $eventHandlerName;
        $self->initNextId();
        $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::userNameEvenNameHashMap->put($self->{eventHandlerName}, $self);
    return $self;
}


sub initNextId {
    my ($self) = @_;
        $self->{eventNameId} = $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::nextId;
        $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::nextId++;
}


sub isEvent {
    my ($self, $userEmailEventNameString) = @_;
        return $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::userNameEvenNameHashMap->containsKey($userEmailEventNameString);
}


# throws Exception
sub getInstance {
    my ($class, $userEmailEventNameString) = @_;
        my $userEmailEventNameData = $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::userNameEvenNameHashMap->get($userEmailEventNameString);
        if (!defined($userEmailEventNameData)) {
            die ("Exception");
        } else {
            return $userEmailEventNameData;
        }
}


sub toString {
    my ($self) = @_;
        return $self->{eventHandlerName};
}

use java::util::HashMap;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::logic::StdUtil;

1;

