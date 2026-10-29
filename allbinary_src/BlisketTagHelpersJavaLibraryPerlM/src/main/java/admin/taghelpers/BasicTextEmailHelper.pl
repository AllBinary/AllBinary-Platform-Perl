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

package admin::taghelpers::BasicTextEmailHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelper';


sub _init_fields {
    my ($self) = @_;
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
    $self->{hashMap} = undef;
    $self->{pageContext} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{pageContext} = $pageContext;
        $self->{hashMap} = $hashMap;
    return $self;
}


# throws Exception
sub send {
    my ($self) = @_;
        my $adminEmailSubject = $self->{hashMap}->get("Subject");
        my $adminEmailTextBody = $self->{hashMap}->get("Body");
        my $adminBasicEmailInfo = 'org::allbinary::logic::communication::smtp::info::AdminEmailInfo'->new($adminEmailSubject, $adminEmailTextBody);
        my $adminEmailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($adminBasicEmailInfo);
        my $adminUserEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons'->getInstance()->getInstance($self->{abeClientInformation}, $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::INSTALLER);
        $adminUserEmailEventHandler->receiveEmailInfo($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::INSTALLER, $adminEmailInfo);
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use org::allbinary::logic::communication::smtp::event::handler::UserEmailEventHandler;
use org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::info::AdminEmailInfo;
use org::allbinary::logic::communication::smtp::info::BasicEmailInfo;
use org::allbinary::logic::communication::smtp::info::EmailInfo;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use admin::taghelpers::TagHelper;

1;

