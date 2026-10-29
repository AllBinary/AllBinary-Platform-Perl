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

package views::admin::inventory::listings::InventoryViewFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws LicensingException
sub getInstance {
    my ($class, $searchRequest) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            return 'views::generic::inventory::InventorySearch'->new($searchRequest);
        } catch ($e) {
            if ($views::admin::inventory::listings::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::listings::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $logUtil->put($commonStrings->{EXCEPTION}, "InventoryViewFactory", "getInstance(SearchRequest)", $e);
            }
            return undef;
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::search::SearchRequest;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::string::CommonStrings;
use views::generic::inventory::InventorySearch;

1;

