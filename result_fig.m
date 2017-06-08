function result_fig(fig_c,gain,theta,beam_direction,fig_info)
   fig_index = 1;
   c = ['y','b','r','g','k'];
   if (fig_c.h ==1)
       figure(fig_index);
       fig_index = fig_index+1;
       if(fig_c.polar ==1)
           gain_max = max(max(gain.h));
           for loop = 1:length(beam_direction.h)
               gain_vector = gain.h(loop,:);
               gain_normal = gain_vector./gain_max;
               gain_db = 10*log10(gain_normal+eps)+40;
               gain_db_bool = gain_db>0;
               gain_db = gain_db.*gain_db_bool;
               polar(theta.h,gain_db,c(mod(loop,5)+1));
               hold on;  
           endfor
          
           if (fig_c.all_beams ==1)
              gain_normal = gain.h_total./gain_max;
              gain_db = 10*log10(gain_normal+eps)+40;
              gain_db_bool = gain_db>0;
              gain_db = gain_db.*gain_db_bool;
              polar(theta.h,gain_db,'k+');
              hold on;   
           endif
           
           if (fig_c.combineW == 1)   
              gain_normal = gain.h_combine./gain_max;
              gain_db = 10*log10(gain_normal+eps)+40;
              gain_db_bool = gain_db>0;
              gain_db = gain_db.*gain_db_bool;
              polar(theta.h,gain_db,'r+');
              hold on;            
           endif   
        else
            for loop = 1:length(gain.h)  
               plot(theta.h_degree,10*log10(gain.h(loop,:)),c(mod(loop,5)+1));
               hold on;
            endfor
            if (fig_c.all_beams ==1)
               plot(theta.h_degree,10*log10(gain.h_total),'k+');  
               hold on; 
            endif
            if (fig_c.combineW == 1) 
               plot(theta.h_degree,10*log10(gain.h_combine),'r+'); 
               hold on; 
            endif
        endif % fig_c.polar
        grid on;
        xlabel('theta');
        ylabel('gain(dB)');
        title('array antenna gain');
        hold off;
    endif %(fig_c.h ==1)   
          
   %%%%%%%vertical domain
   if (fig_c.v ==1)
       figure(fig_index);
       fig_index = fig_index+1;
       if(fig_c.polar ==1)
           gain_max = max(max(gain.v));
           for loop = 1:length(length(beam_direction.v))
               gain_vector = gain.v(loop,:);
               gain_normal = gain_vector./gain_max;
               gain_db = 10*log10(gain_normal+eps)+40;
               gain_db_bool = gain_db>0;
               gain_db = gain_db.*gain_db_bool;
               polar(theta.v,gain_db,c(mod(loop,5)+1));
               hold on;  
           endfor
          
           if (fig_c.all_beams ==1)
              gain_normal = gain.v_total./gain_max;
              gain_db = 10*log10(gain_normal+eps)+40;
              gain_db_bool = gain_db>0;
              gain_db = gain_db.*gain_db_bool;
              polar(theta.v,gain_db,'k-');
              hold on;   
           endif
           
           if (fig_c.combineW == 1)   
              gain_normal = gain.v_combine./gain_max;
              gain_db = 10*log10(gain_normal+eps)+40;
              gain_db_bool = gain_db>0;
              gain_db = gain_db.*gain_db_bool;
              polar(theta.v,gain_db,'r+');
              hold on;            
           endif   
        else
            for loop = 1:length(gain.h)  
               plot(theta.v_degree,10*log10(gain.v(loop,:)),c(mod(loop,5)+1));
               hold on;
            endfor
            if (fig_c.all_beams ==1)
               plot(theta.v_degree,10*log10(gain.v_total),'k-');  
               hold on; 
            endif
            if (fig_c.combineW == 1) 
               plot(theta.v_degree,10*log10(gain.v_combine),'r+'); 
               hold on; 
            endif
        endif % fig_c.polar
        grid on;
        xlabel('theta');
        ylabel('gain(dB)');
        title('array antenna gain');
        hold off;
    endif %(fig_c.h ==1)     
    
    %%%%%%%3D picture
   if (fig_c.d3 ==1)

       for loop_h = 1:length(beam_direction.h)
          for loop_v = 1:length(beam_direction.v)
            figure(fig_index);
            fig_index = fig_index+1;
            pcolor(fig_info.y,fig_info.x,gain.d3(loop_h,loop_v).matrix);
            shading interp
            colorbar
            xlabel(fig_info.x_axis)
            ylabel(fig_info.y_axis)
            title(fig_info.title)
          endfor
       endfor   
 
       hold off;
    endif %(fig_c.3d ==1)   