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

package views::business::context::modules::storefront::generator::PreviewGeneratorStoreFrontContextView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::generator::GeneratorStoreFrontContextView';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            my $httpTransformInfoInterface = $self->getTransformInfoInterface();
            $httpTransformInfoInterface->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{PARTIAL}, 'org::allbinary::string::CommonSeps'->getInstance()->{SPACE} + 'org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance()->{PREVIEW});
            return $self->view('org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance()->{PREVIEW});
        } catch ($e) {
            if ($views::business::context::modules::storefront::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::TransformInfosData;
use org::allbinary::string::CommonSeps;
use views::business::context::modules::storefront::generator::GeneratorStoreFrontContextView;

1;

