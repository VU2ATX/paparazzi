(*
 * $Id$
 *
 * Speech support for GCS alerts
 *  
 * Copyright (C) 2011
 *
 * This file is part of paparazzi.
 *
 * paparazzi is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * paparazzi is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with paparazzi; see the file COPYING.  If not, write to
 * the Free Software Foundation, 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA. 
 *
 *)

let active = ref false

let say = fun s ->
  (
  if !active then (
    (* If the os is Linux, use "spd-say" (add additional cases here if necessary) *)
    if Os_calls.contains (Os_calls.os_name) "Linux" then
      ignore (Sys.command (Printf.sprintf "spd-say '%s'&" s))    
    (* If the os is Darwin, then use "say" *)
    else if Os_calls.contains (Os_calls.os_name) "Darwin" then
      ignore (Sys.command (Printf.sprintf "say '%s'&" s))
    (* If the os is anything else, not supported (add additional cases here if necessary) *)
    else
      ignore (Sys.command (Printf.sprintf "echo Current OS not supported by -speech option"))
  ));;
