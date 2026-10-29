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

package views::business::context::modules::storefront::customizer::StoreCustomizerComponentUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'views::business::context::modules::storefront::customizer::StoreCustomizerComponentUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $views::business::context::modules::storefront::customizer::StoreCustomizerComponentUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub generate {
    my ($self, $abeClientInformation, $transformInfoInterface) = @_;
        if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Generating Modified Views For: " . $transformInfoInterface->getName(), $self, "generateModifiedViews()");
        }
        my $customizerUtil = 'views::business::context::modules::storefront::customizer::CustomizerUtil'->getInstance();
        my $allCustomizedViews = $customizerUtil->getTransformInfoObjectConfigGroupComponentNodes($transformInfoInterface);
        my $size = $allCustomizedViews->size();
        for (my $index = 0; $index < $size; $index++) {
            my $nextTransformInfoInterface = $allCustomizedViews->get($index);
            my $allViewsToBeModified = $customizerUtil->getTransformInfoObjectConfigComponentNodesToCustomize($transformInfoInterface, $nextTransformInfoInterface);
            if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("View or component that was modified by a Customizer: " . $nextTransformInfoInterface->getName(), $self, "generateModifiedViews()");
            }
            $self->generate($abeClientInformation, $transformInfoInterface, $allViewsToBeModified);
        }
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub generate {
    my ($self, $abeClientInformation, $transformInfoInterface, $allViewsToBeModifiedVector) = @_;
        my $customizerUtil = 'views::business::context::modules::storefront::customizer::CustomizerUtil'->getInstance();
        my $size = $allViewsToBeModifiedVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $nextTransformInfoInterface = $allViewsToBeModifiedVector->get($index);
            my $specifiedTransformInfoInterface = $customizerUtil->getTransformInfoInterfaceToCustomize($transformInfoInterface, $nextTransformInfoInterface);
            if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Retrieved: " . $specifiedTransformInfoInterface->getName(), $self, "generateModifiedViews()");
            }
            'org::allbinary::logic::visual::transform::generator::TransformGeneratorUtil'->getInstance()->generate($abeClientInformation, $nextTransformInfoInterface, $specifiedTransformInfoInterface);
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::generator::TransformGeneratorUtil;
use org::allbinary::logic::visual::transform::info::TransformInfo;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use views::business::context::modules::storefront::customizer::CustomizerUtil;

1;

