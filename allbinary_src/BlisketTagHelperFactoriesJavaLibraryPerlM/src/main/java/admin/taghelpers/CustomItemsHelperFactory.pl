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

package admin::taghelpers::CustomItemsHelperFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelperFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws LicensingException
sub getInstance {
    my ($self, $hashMap, $pageContext) = @_;
        try {
            return 'admin::taghelpers::CustomItemsHelper'->new($hashMap, $pageContext);
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{GET_INSTANCE}, $e);
            }
            return undef;
        }
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use admin::taghelpers::TagHelperFactory;
use admin::taghelpers::CustomItemsHelper;

1;

