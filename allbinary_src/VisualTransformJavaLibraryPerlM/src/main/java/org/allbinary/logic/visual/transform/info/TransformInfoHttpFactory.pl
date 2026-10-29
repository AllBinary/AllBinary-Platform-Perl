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

package org::allbinary::logic::visual::transform::info::TransformInfoHttpFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $propertiesHashMap, $pageContext) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            my $weblisketSession = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($propertiesHashMap, $pageContext);
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($weblisketSession->getStoreName())) {
                my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($weblisketSession->getStoreName());
                if (defined($storeFrontInterface)) {
                    return 'org::allbinary::logic::visual::transform::info::TransformInfoHttpStore'->new($storeFrontInterface, $propertiesHashMap, $pageContext);
                } else {
                    die ("No StoreFront with: " . $weblisketSession->getStoreName());
                }
            } else {
                return 'org::allbinary::logic::visual::transform::info::TransformInfoHttpContext'->new($propertiesHashMap, $pageContext);
            }
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $logUtil->put($commonStrings->{EXCEPTION}, "TransformInfoFactory", $commonStrings->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpContext;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpStore;

1;

