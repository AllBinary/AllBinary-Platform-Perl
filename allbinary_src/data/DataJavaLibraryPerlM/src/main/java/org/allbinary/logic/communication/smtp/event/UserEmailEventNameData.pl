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
use parent -norequire,'java::lang::Object';

tie our $userNameEvenNameHashMap, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap() };
our $nextId = 0;
tie our $INSTALLER, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Installer") };
tie our $EXCEPTION, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Exception") };
tie our $LOGGEDEXCEPTION, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Logged Exception") };
tie our $ERROR, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Error") };
tie our $OUTOFMEMORY, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Out Of Memory Error") };
tie our $ADMINGENERATINGSTATICPAGES, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Admin Generating Static Pages") };
tie our $STOREERROROCCURRED, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Error Occurred") };
tie our $STOREOUTOFMEMORY, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Out Of Memory Error") };
tie our $STORECREATED, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Created") };
tie our $STOREOPENED, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Opened") };
tie our $STORECLOSED, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Closed") };
tie our $STOREGENERATINGSTATICPAGES, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Store Generating Static Pages") };
tie our $PRODUCTISOUT, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Product Is Out") };
tie our $PRODUCTISAVAILABLE, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Product Is Available") };
tie our $PRODUCTISOLD, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Product Is Old") };
tie our $PRODUCTISONSALE, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Product Is On Sale") };
tie our $PRODUCTSALEISOVER, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Product Sale Is Over") };
tie our $ORDERPREPROCESSING, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSING) };
tie our $ORDERPROCESSING, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PROCESSING) };
tie our $ORDERCANCELLED, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLED) };
tie our $ORDERPARTIALLYSHIPPED, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PARTIALLYSHIPPED) };
tie our $ORDERSHIPPED, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPED) };
tie our $QUOTEREQUEST, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("Quote Request") };
tie our $NEWPASSWORD, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->new("New Password") };

sub _init_fields {
    my ($self) = @_;
    $self->{eventNameId} = 0;
    $self->{eventHandlerName} = undef;
}


sub new {
    my ($class, $eventHandlerName) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
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

use java::lang::Object ();
use java::lang::LazyStatic ();
use java::util::HashMap ();
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData ();
use org::allbinary::logic::StdUtil ();

1;

